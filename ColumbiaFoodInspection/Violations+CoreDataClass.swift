//
//  Violations+CoreDataClass.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData

@objc(Violations)
public class Violations: NSManagedObject {
    convenience init?(comments:String?, violationCode:String?, violationName:String?, criticality:String?) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        self.init(entity: Violations.entity(),insertInto: context)
        self.comments = comments
        self.violationCode = violationCode
        self.violationName = violationName
        self.criticality = criticality
    }
  
}
