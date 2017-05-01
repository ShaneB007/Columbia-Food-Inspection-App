//
//  Inspection+CoreDataProperties.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData


extension Inspection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Inspection> {
        return NSFetchRequest<Inspection>(entityName: "Inspection")
    }

    @NSManaged public var comments: String?
    @NSManaged public var date: String?
    @NSManaged public var type: String?
    @NSManaged public var results: Results?
    @NSManaged public var violations: Violations?

}
