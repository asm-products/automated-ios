//
//  WelcomeDeviceCollectionViewCell.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import UIKit

class WelcomeDeviceCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet var deviceIconImageView:UIImageView!
	@IBOutlet var enabledTickImageView:UIImageView!
	
	func configureWithDevice(device:DeviceProfile) {
		deviceIconImageView.image = UIImage(named: device.iconImageName!)
	}

	func setEnabled(enabled:Bool) {
		enabledTickImageView.hidden = !enabled
	}
	
}