//
//  Results+CoreDataProperties.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData


extension Results {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Results> {
        return NSFetchRequest<Results>(entityName: "Results")
    }

    @NSManaged public var critical: Int64
    @NSManaged public var noncritical: Int64

}
