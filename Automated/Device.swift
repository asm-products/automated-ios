//
//  Device.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Device: NSManagedObject, DeviceProtocol {

    @NSManaged var actions: NSSet

	func authenticateFromViewController(viewController: UIViewController, success: () -> (), error: () -> ()) {
		assert(false, "Device authenticate method called. Extended class should also implement DeviceProtocol")
	}

}
