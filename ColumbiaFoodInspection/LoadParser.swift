//
//  loadParser.swift
//  finalProjectParser
//
//  Created by Shane Bishop on 4/20/17.
//  Copyright © 2017 Shane Bishop. All rights reserved.
//

import Foundation

class JSONLoader {
    
    class func load(fileName: String) -> [Item] {
        var items = [Item]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            items = MainJSONParser.parse(data)
        }
        return items
    }
}



