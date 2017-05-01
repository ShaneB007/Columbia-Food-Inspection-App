//
//  Establishment+CoreDataClass.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import CoreData

@objc(Establishment)
public class Establishment: NSManagedObject {
    convenience init?(name: String?, address: String?, type: String?) {
        guard let context = Model.sharedInstance.managedContext else { return nil }
        self.init(entity: Establishment.entity(),insertInto: context)
        self.name = name
        self.address = address
        self.type = type
    }
    
}
