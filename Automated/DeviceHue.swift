//
//  DeviceHue.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DeviceHue: Device, DeviceProtocol {

    @NSManaged var host: String
    @NSManaged var username: String
	
	override func authenticateFromViewController(viewController: UIViewController, success: () -> (), error: () -> ()) {
		
	}

}
