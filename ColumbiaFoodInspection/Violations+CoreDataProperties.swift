//
//  Violations+CoreDataProperties.swift
//  ColumbiaFoodInspection
//
//  Created by Shane Bishop on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData


extension Violations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Violations> {
        return NSFetchRequest<Violations>(entityName: "Violations")
    }

    @NSManaged public var comments: String?
    @NSManaged public var criticality: String?
    @NSManaged public var violationCode: String?
    @NSManaged public var violationName: String?
    @NSManaged public var inspection: Inspection?

}
