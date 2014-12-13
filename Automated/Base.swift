//
//  Base.swift
//  Automated
//
//  Created by Nick Babenko on 13/12/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation

class Base: NSManagedObject {
	
	class func MR_entityName() -> NSString {
		return NSStringFromClass(self).componentsSeparatedByString(".").last!
	}

}
