//
//  Results+CoreDataClass.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData

@objc(Results)
public class Results: NSManagedObject {
    convenience init(critical: Int64, noncritical: Int64) {
        let context = Model.sharedInstance.managedContext
        self.init(entity: Results.entity(),insertInto: context)
        self.critical = critical
        self.noncritical = noncritical
    }
   
}
