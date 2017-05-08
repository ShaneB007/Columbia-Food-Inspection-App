//
//  Inspection+CoreDataClass.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData

@objc(Inspection)
public class Inspection: NSManagedObject {
    convenience init?(date: String?, type: String?, comments: String?, results: Results, violations: Violations) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        self.init(entity: Inspection.entity(),insertInto: context)
        self.date = date
        self.type = type
        self.comments = comments
        self.results = results
        self.violations = violations
    }

}
