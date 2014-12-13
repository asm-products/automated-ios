//
//  ActivityAction.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation
import CoreData

class ActivityAction: Base {

    @NSManaged var method: String
    @NSManaged var arguments: AnyObject
    @NSManaged var device: Device

}
