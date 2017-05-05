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
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let root = json as? [String: Any],
            let status = root["status"] as? String,
            status == "ok" {
            if let items = root["items"] as? [Any] {
                for item in items {
                    var fullItem = Item()
                    var violation = Violations()
                    var result = Results()
                    if let item = item as? [String: Any] {
                        if let establishment = item["establishment"] as? [String: Any] {
                             let name = establishment["name"] as? String
                             let address = establishment["address"] as? String
                            let type = establishment["type"] as? String
                            
                            if let establish = Establishment(name: name, address: address, type: type) {
                               fullItem.establishment = establish
                            }

                        }
                        
                        if let inspection = item["inspection"] as? [String: Any] {
                            if let results = inspection["results"] as? [String: Any] {
                                
                                let critical = results["critical"] as? Int64
                                let noncritical = results["noncritical"] as? Int64
                                result.critical = critical!
                                result.noncritical = noncritical!
                                

                            }
                            let date = inspection["date"] as? String
                            let type = inspection["type"] as? String
                            let comments = inspection["comments"] as? String
                            if let violations = inspection["violations"] as? [String: Any] {
                        
                                let comments = violations["comments"] as? String
                                let violationName = violations["violationName"] as? String
                                let violationCode = violations["violationCode"] as? String
                                let criticality = violations["criticality"] as? String
                                violation.comments = comments
                                violation.violationName = violationName
                                violation.violationCode = violationCode
                                violation.criticality = criticality
                            }
                            if let inspect = Inspection(date: date, type: type, comments: comments, results: result, violations: violation) {
                                fullItem.inspection = inspect
                            }
                        }
                        
                       
                    
                        
                            itemArray.append(fullItem)
                        
                        
                        
                        }
                    
                    
                    
                    }
                

                }
                
            }
            return itemArray
        }

}

