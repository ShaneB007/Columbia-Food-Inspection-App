//
//  PrimaryTableViewController.swift
//  ColumbiaFoodInspection
//
//  Created by Shane Bishop on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit

class PrimaryTableViewController: UITableViewController,  UISearchResultsUpdating {

    
    @IBOutlet var itemTableView: UITableView!
    var searchController: UISearchController!
    var items = [Item]()
    var fillteredItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Model.sharedInstance.loadData()
        items = Model.sharedInstance.fetchCategories()
        
        fillteredItems = items
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        itemTableView.tableHeaderView = searchController.searchBar
        
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
        
        cell.textLabel?.text = fillteredItems[indexPath.row].establishment?.name!
        cell.detailTextLabel?.text = fillteredItems[indexPath.row].inspection?.violations?.criticality!
        
        
        //print(items[indexPath.row].inspection?.results?.critical, items[indexPath.row].inspection?.results?.noncritical)
        
        if let crit = items[indexPath.row].inspection?.results?.critical{
            switch crit{
            case 0..<2:
                cell.backgroundColor = UIColor.green
            case 2..<4:
                cell.backgroundColor = UIColor.yellow
            case 4..<6:
                cell.backgroundColor = UIColor.orange
            default:
                cell.backgroundColor = UIColor.red
                
            }
        }
        
//        if let noncrit = items[indexPath.row].inspection?.results?.noncritical{
//            switch noncrit{
//                case 0..<6:
//                    if (cell.backgroundColor == UIColor.green){
//                        cell.backgroundColor = UIColor.green
//                    }
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
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            fillteredItems = filter(searchText)
            itemTableView.reloadData()
        }
    }

    
    func filter(_ searchText: String) -> Array<Item> {
        var filteredItems = Array<Item>()
        
        if searchText.isEmpty {
            filteredItems = items
        } else {
            for item in items {
                if item.establishment?.name!.range(of: searchText, options: .caseInsensitive) != nil {
                    filteredItems.append(item)
                } 
            }
        }
        
        return filteredItems
    }

}
