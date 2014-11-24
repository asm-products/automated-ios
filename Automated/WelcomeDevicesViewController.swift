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
	
	var devices = [DeviceProfile]()
	
	
	// MARK: IBOutlet
	
	@IBOutlet var collectionView:UICollectionView?
	
	
	// MARK: WelcomeDevicesViewController
	
	private func loadDevices() {
		let deviceListUrl = NSBundle.mainBundle().URLForResource(DeviceDefinitionFileName, withExtension: "plist")!
		let deviceArray = NSArray(contentsOfURL: deviceListUrl) as Array<NSDictionary>
		let parser = DCKeyValueObjectMapping.mapperForClass(DeviceProfile)
		
		devices = parser.parseArray(deviceArray) as [DeviceProfile]
	}
	
	private func configureCollectionView() {
		
	}
	
	
	// MARK: UICollectionViewDataSource
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return devices.count
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		var collectionViewCell:WelcomeDeviceCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(
			WelcomeDeviceCollectionViewCellIdentifier, forIndexPath: indexPath) as WelcomeDeviceCollectionViewCell
		
		collectionViewCell.configureWithDevice(devices[indexPath.row])
		
		return collectionViewCell
	}
	
	
	// MARK: UICollectionViewDelegate
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		var device = devices[indexPath.row]
		var deviceModel = device.modelClass()
		
		deviceModel.authenticateWithSuccess({
			
		}, error: {
				
		})
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
		
		loadDevices()
	}

}
