//
//  FirebaseExtension.swift
//  Automated
//
//  Created by Nick Babenko on 24/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation

extension Firebase {
	
	class var nestInstance:Firebase {
		struct Static {
			static let nestInstance:Firebase = Firebase(url: GlobalConstants.UrlNestApi);
		}
		return Static.nestInstance
	}
	
	func persistAccessToken(accessToken:String) {
		NSUserDefaults.standardUserDefaults().setObject(accessToken, forKey: GlobalConstants.KeyNestOAuthAccessToken)
	}
	
	func authenticateIfAccessTokenFound(completionBlock: (error:NSError!, authData: FAuthData!) -> ()) {
		var accessToken:String? = NSUserDefaults.standardUserDefaults().objectForKey(GlobalConstants.KeyNestOAuthAccessToken) as String?
		
		if(accessToken != nil) {
			self.authWithCustomToken(accessToken, withCompletionBlock: completionBlock)
		}
	}
}