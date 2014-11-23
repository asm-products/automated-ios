//
//  ScenarioViewController.swift
//  Automated
//
//  Created by Nick Babenko on 22/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//
//  This view will show the user current available activities, which they previously configured.
//  The activities loaded can be based on a number of things such as;
//  current location, time of day and maybe even a custom picker, to select a custom set of activities or view all.
//

import UIKit

class ActivityViewController: UIViewController {
	
	// MARK: Static
	
	let ShowWelcomeViewIdentifier = "ShowWelcomeView"
	

	// MARK: IBOutlet
	
	@IBOutlet var welcomeViewController:WelcomeViewController?
	
	
	// MARK: ActivityViewController
	
	private func checkAndShowWelcomeView() {
		if(UserPreferences.sharedInstance().welcomeViewShownOnStartup == false) {
			performSegueWithIdentifier(ShowWelcomeViewIdentifier, sender: self)
		}
	}
	
	
	// MARK: UIViewController
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		checkAndShowWelcomeView()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}