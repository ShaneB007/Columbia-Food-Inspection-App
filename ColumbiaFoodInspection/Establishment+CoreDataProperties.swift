//
//  Establishment+CoreDataProperties.swift
//  ColumbiaFoodInspection
//
//  Created by Shane Bishop on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData


extension Establishment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Establishment> {
        return NSFetchRequest<Establishment>(entityName: "Establishment")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var item: Item?

}
