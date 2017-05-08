//
//  XMLParser.swift
//  RSSFeedParser
//
//  Created by Dale Musser on 11/21/16.
//  Copyright © 2016 Dale Musser. All rights reserved.
//

import Foundation

class MainJSONParser {
    
    //static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [Item] {
        var itemArray = [Item]()
        let status = "ok"
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
             status == "ok"{
            if let items = root["item"] as? [Any] {
                for item in items {
                    var violation: Violations? = nil
                    var result: Results? = nil
                    var establish: Establishment? = nil
                    var inspect: Inspection? = nil
                    
                    if let item = item as? [String: Any] {
                        if let establishment = item["establishment"] as? [String: Any] {
                            let name = establishment["name"] as? String
                            let address = establishment["address"] as? String
                            let type = establishment["type"] as? String
                            
                            establish = Establishment(name: name, address: address, type: type)

                        }
                        
                        if let inspection = item["inspection"] as? [String: Any] {
                            if let results = inspection["results"] as? [String: Any] {
                                
                                let critical = results["critical"] as? Int64
                                let noncritical = results["noncritical"] as? Int64
                                
                                result = Results(critical: critical!, noncritical: noncritical!)
                                

                            }
                            
                            let date = inspection["date"] as? String
                            let type = inspection["type"] as? String
                            let comments = inspection["comments"] as? String
                            
                            if let violations = inspection["violations"] as? [String: Any] {
                                
                                let comments = violations["comments"] as? String
                                let violationName = violations["violationName"] as? String
                                let violationCode = violations["violationCode"] as? String
                                let criticality = violations["criticality"] as? String
                                
                                violation = Violations(comments: comments, violationCode: violationCode, violationName: violationName, criticality: criticality)
                                inspect = Inspection(date: date, type: type, comments: comments, results: result, violations: violation)!
                            }
                            
                        }
                        
                    
                        var fullItem = Item(establishment: establish, inspection: inspect)
                        itemArray.append(fullItem)
                        
                        
                        
                        }
                    
                    
                    
                    }
                

                }
                
            }
        print(itemArray[1])
            return itemArray
        }

}

