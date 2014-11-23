//
//  TriggerTime.swift
//  Automated
//
//  Created by Nick Babenko on 23/11/2014.
//  Copyright (c) 2014 Automated. All rights reserved.
//

import Foundation
import CoreData

class TriggerTime: NSManagedObject {

    @NSManaged var startTime: NSDate
    @NSManaged var endTime: NSDate

}
