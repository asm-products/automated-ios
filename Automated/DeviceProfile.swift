//
//  DeviceConfiguration.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import UIKit

class DeviceProfile: NSObject {
 
	var title:String?
	var iconImageName:String?
	var modelClassName:String?
	
	func modelClass() -> Device {
		var modelClass:Device.Type! = NSClassFromString(modelClassName) as Device.Type
		
		return modelClass()
	}
	
}