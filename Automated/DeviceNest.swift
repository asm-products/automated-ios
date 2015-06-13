//
//  DeviceNest.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DeviceNest: Device, DeviceProtocol, UIWebViewDelegate {

	// MARK: NSManagedObject
	
    @NSManaged var oauthToken: String
	
	
	// MARK: DeviceNest
	
	var currentState:String?
	var initialRequestStarted = false
	var webViewController:WebViewController?
	
	// TODO: Configure GlobalConstants.OAuthTypeNest API details, be good if the process was automated.
	// Loading all device-sub-types and calling a method on it configured in DeviceProtocol.
	
	override func authenticateFromViewController(viewController: UIViewController, success: () -> (), error: () -> ()) {
		configureOAuthNotificationObservers()
		
		// Show web view
		webViewController = viewController.storyboard?.instantiateViewControllerWithIdentifier(GlobalConstants.IdentifierWebView) as? WebViewController
		
		viewController.navigationController?.presentViewController(webViewController!, animated: true, completion: nil)
		
		if(webViewController?.webView == nil) {
			println("null webview")
		}
		
		webViewController?.webView.delegate = self
		
		// Request access token and load web view auth page
		NXOAuth2AccountStore.sharedStore().requestAccessToAccountWithType(GlobalConstants.OAuthTypeNest, withPreparedAuthorizationURLHandler: { (url:NSURL!) in
			self.currentState = self.randomState()
			
			var urlWithState:NSURL = NSURL(string: url.absoluteString! + "&state=" +
				self.currentState!)!
			
			self.webViewController?.webView.loadRequest(NSURLRequest(URL: urlWithState))
		})
	}
	
	private func configureOAuthNotificationObservers() {
		NSNotificationCenter.defaultCenter().addObserverForName(NXOAuth2AccountStoreAccountsDidChangeNotification,
			object: NXOAuth2AccountStore.sharedStore(),
			queue: nil,
			usingBlock: { (notification:NSNotification!) in
				var firebase = Firebase.nestInstance
				var accounts:NSArray = NXOAuth2AccountStore.sharedStore().accountsWithAccountType(
					GlobalConstants.OAuthTypeNest)
				
				if(accounts.count > 0) {
					var account:NXOAuth2Account = accounts.firstObject as NXOAuth2Account
					
					firebase.authWithCustomToken(account.accessToken.accessToken, withCompletionBlock: {
						(error:NSError!, authData:FAuthData!) in
						if(error != nil) {
							self.showAuthFailedAlert()
						}
						else {
							// Persist for next time
							firebase.persistAccessToken(account.accessToken.accessToken)
							
							self.dismissNestAuthView()
						}
					})
				}
				else {
					self.showAuthFailedAlert()
				}
			}
		)
		
		NSNotificationCenter.defaultCenter().addObserverForName(NXOAuth2AccountStoreDidFailToRequestAccessNotification,
			object: NXOAuth2AccountStore.sharedStore(),
			queue: nil,
			usingBlock: { (notification:NSNotification!) in
				self.showAuthFailedAlert()
			}
		)
	}
	
	private func dismissNestAuthView() {
		if(webViewController != nil) {
			webViewController?.dismissViewControllerAnimated(true, completion: nil)
		}
	}
	
	private func showAuthFailedAlert() {
		var alertView:UIAlertView = UIAlertView(title: "Nest Authentication", message: "Nest Authentication failed.",
			delegate: nil, cancelButtonTitle: "OK")
		
		alertView.show()
	}
	
	private func randomState() -> String {
		var chars = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "Y", "Z"]
		var string = ""
		
		for num in 0...9 {
			string += chars[randomNumberLessThan(chars.count)]
		}
		
		return string
	}
	
	private func randomNumberLessThan(maxNumber: Int) -> Int {
		return Int(arc4random()) % maxNumber
	}
	
	
	// MARK: UIWebViewDelegate
	
	func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest,
		navigationType: UIWebViewNavigationType) -> Bool {
			if(!initialRequestStarted) {
				initialRequestStarted = true
				
				return true
			}
			
			if(request.URL.absoluteString?.rangeOfString(NSString(format: "state=%@", currentState!)) != nil) {
				return NXOAuth2AccountStore.sharedStore().handleRedirectURL(request.URL)
			}
			
			return true
	}

}
