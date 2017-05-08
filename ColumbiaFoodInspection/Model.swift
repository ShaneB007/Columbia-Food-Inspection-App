//
//  Model.swift
//  ColumbiaFoodInspection
//
//  Created by Colin Iglehart on 5/1/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Model {
    var managedContext: NSManagedObjectContext?
    
    static var sharedInstance: Model = Model()
    
    init(){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let persistentContainer = appDelegate?.persistentContainer
        managedContext = persistentContainer?.viewContext
    }
    
    
    func loadData() {
        let coreDataLoadedKey = "hasLoadedCoreData"
        
        guard !UserDefaults.standard.bool(forKey: coreDataLoadedKey) else { return }
        
        let items = JSONLoader.load(fileName: "newData")
        
        
        
       /* for newsCategory in newsCategories {
            // TODO: - Parse categories
        } */
        
        do {
            try self.managedContext?.save()
            
            UserDefaults.standard.set(true, forKey: coreDataLoadedKey)
            
        } catch {
            return
        }
    }
    
    func fetchCategories() -> [Item] {
        do {
            let array = try managedContext?.fetch(Item.fetchRequest()) ?? []
            return array
        } catch {
            return []
        }
    }
    
    func saveContext() {
        guard let context = managedContext,
        context.hasChanges else { return }
        
        try? context.save()
    }
    
}
