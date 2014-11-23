//
//  Activity.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation
import CoreData

class Activity: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var enabled: NSNumber
    @NSManaged var triggers: NSSet

}
