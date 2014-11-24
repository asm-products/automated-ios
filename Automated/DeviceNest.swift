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

class DeviceNest: Device, DeviceProtocol {

    @NSManaged var oauthToken: String
	
	func authenticateFromViewController(viewController: UIViewController, success: () -> (), error: () -> ()) {
		
	}

}
