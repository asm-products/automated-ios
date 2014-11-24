//
//  DeviceProtocol.swift
//  Automated
//
//  Created by Nick Babenko on 24/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import UIKit

protocol DeviceProtocol {
	
	func authenticateFromViewController(viewController: UIViewController, success: () -> (), error: () -> ())
   
}
