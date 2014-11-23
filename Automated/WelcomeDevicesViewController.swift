//
//  WelcomeViewController.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import UIKit

class WelcomeDevicesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	// MARK: Constants
	
	let WelcomeDeviceCollectionViewCellIdentifier = "WelcomeDeviceCollectionViewCell"
	let DeviceDefinitionFileName = "Devices"
	
	
	// MARK: Data
	
	var devices:NSArray!
	
	
	// MARK: IBOutlet
	
	@IBOutlet var collectionView:UICollectionView?
	
	
	// MARK: WelcomeDevicesViewController
	
	private func configureCollectionView() {
		
	}
	
	
	// MARK: UICollectionViewDataSource
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if(devices == nil) {
			return 0
		}
		
		return devices.count
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		var collectionViewCell:WelcomeDeviceCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(
			WelcomeDeviceCollectionViewCellIdentifier, forIndexPath: indexPath) as WelcomeDeviceCollectionViewCell
		
		return collectionViewCell
	}
	
	
	// MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	
	// MARK: NSObject
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		var deviceListUrl:NSURL = NSBundle.mainBundle().URLForResource(DeviceDefinitionFileName, withExtension: "plist")!
		devices = NSArray(contentsOfURL: deviceListUrl)
	}

}
