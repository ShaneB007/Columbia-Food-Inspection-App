//
//  Item+CoreDataClass.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    convenience init(establishment: Establishment?, inspection: Inspection?) {
        let context = Model.sharedInstance.managedContext
        self.init(entity: Item.entity(),insertInto: context)
        self.establishment = establishment
        self.inspection = inspection
    }

}
