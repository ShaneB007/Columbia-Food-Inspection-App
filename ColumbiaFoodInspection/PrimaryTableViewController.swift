//
//  PrimaryTableViewController.swift
//  ColumbiaFoodInspection
//
//  Created by Shane Bishop on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit

class PrimaryTableViewController: UITableViewController {

    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.sharedInstance.loadData()
        items = Model.sharedInstance.fetchCategories()
        
        print(items[0])
        
        title = "CoMo Food Inspections"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source
    
    
    



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Established List Cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].establishment?.name!
        cell.detailTextLabel?.text = items[indexPath.row].inspection?.violations?.criticality!
        
        // let critFixed =  Int(truncatingBitPattern: crit!)
        let crit = items[indexPath.row].inspection?.results?.critical
        //let critFixed =  Int(truncatingBitPattern: crit!)
        if crit == 2{
            cell.backgroundColor = UIColor.yellow
        }
        print(items[indexPath.row].inspection?.results?.critical, items[indexPath.row].inspection?.date, items[indexPath.row].inspection?.comments)
        
//        if let crit = items[indexPath.row].inspection?.results?.critical{
//            switch crit{
//            case 2:
//                cell.backgroundColor = UIColor.green
//            case 3:
//                cell.backgroundColor = UIColor.yellow
//            case 5:
//                cell.backgroundColor = UIColor.orange
//            default:
//                cell.backgroundColor = UIColor.red
//                
//            }
//        }
//        if let noncrit = items[indexPath.row].inspection?.results?.noncritical{
//            switch noncrit{
//                case 0..<6:
//                    cell.backgroundColor = UIColor.green
//                case 6..<11:
//                    cell.backgroundColor = UIColor.yellow
//                case 11..<21:
//                    cell.backgroundColor = UIColor.orange
//                case 21..<45:
//                    cell.backgroundColor = UIColor.red
//                default:
//                    cell.backgroundColor = UIColor.white
//            }
//        }
        
        return cell
    }
    
  
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EstablishmentDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            
                destination.item = items[indexPath.row]
            
            
        }
    }
    
//    func filter(_ searchText: String) -> Array<Item> {
//        var filteredItems = Array<Item>()
//        
//        if searchText.isEmpty {
//            filteredItems = items
//        } else {
//            for item in items {
//                if item.establishment?.name(of: searchText, options: .caseInsensitive) != nil {
//                    filteredItems.append(item)
//                } else if photo.description.range(of: searchText, options: .caseInsensitive) != nil {
//                    filteredPhotos.append(photo)
//                }
//            }
//        }
//        
//        return filteredPhotos
//    }

}
