//
//  FavoritesTableViewController.swift
//  ColumbiaFoodInspection
//
//  Created by Shane Bishop on 5/10/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit

class FavoritesTableViewController: UITableViewController {
    
    
    
    @IBOutlet var favTableView: UITableView!
   
    var searchController: UISearchController!
    var items = [Item]()
    var fillteredItems = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // Model.sharedInstance.loadData()
        items = Model.sharedInstance.fetchCategories()
        
        fillteredItems = filter()
        
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.sizeToFit()
//        favTableView.tableHeaderView = searchController.searchBar
        
        title = "CoMo Food Inspections"
        tableView.backgroundColor = UIColor.init(red: 0.09, green: 0.38, blue: 0.62, alpha: 1.0)
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
        return fillteredItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorite Cell", for: indexPath)
        
        cell.textLabel?.text = fillteredItems[indexPath.row].establishment?.name!
        cell.detailTextLabel?.text = fillteredItems[indexPath.row].establishment?.address!
        
        
        if let crit = fillteredItems[indexPath.row].inspection?.results?.critical{
            switch crit{
            case 0..<2:
                cell.textLabel?.textColor = UIColor.init(red: 0.07, green: 0.67, blue: 0.04, alpha: 1.0)
            case 2..<4:
                cell.textLabel?.textColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.00, alpha: 1.0)
            case 4..<6:
                cell.textLabel?.textColor = UIColor.orange
            default:
                cell.textLabel?.textColor = UIColor.red
                
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
            
            destination.item = fillteredItems[indexPath.row]
            
            
        }
    }
    
//    func updateSearchResults(for searchController: UISearchController) {
//        if let searchText = searchController.searchBar.text {
//            fillteredItems = filter(searchText)
//            favTableView.reloadData()
//        }
//    }
    
    
    func filter() -> Array<Item> {
        var filteredItems = Array<Item>()
        
        
            for item in items {
                if item.favorite == true {
                    filteredItems.append(item)
                } 
            }
        
        
        return filteredItems
    }
    
}
