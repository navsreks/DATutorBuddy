//
//  AllTuteeViewController.swift
//  DATutorBuddy
//
//  Created by Madhura  Bhat on 12/2/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AllTuteeViewController: UITableViewController, UISearchResultsUpdating, NSFetchedResultsControllerDelegate  {
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController!
    
    var searchController : UISearchController!
    
    var MyTutee: [TuteeObject] = []
    
    var searchResults : [TuteeObject] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let fr = NSFetchRequest(entityName: "TuteeObject")
        
        let sd = NSSortDescriptor(key: "iTime", ascending: true)
        fr.sortDescriptors = [sd]
        
        frc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        
        do {
            try frc.performFetch()
            MyTutee = frc.fetchedObjects as! [TuteeObject]
            
        }
        catch {
            print(error)
            return
            
        }
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        self.searchController.hidesNavigationBarDuringPresentation = false;
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = self.searchController.searchBar
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let fr = NSFetchRequest(entityName: "TuteeObject")
        
        let sd = NSSortDescriptor(key: "iTime", ascending: true)
        fr.sortDescriptors = [sd]
        
        frc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        
        
        do {
            try frc.performFetch()
            MyTutee = frc.fetchedObjects as! [TuteeObject]
            
        }
        catch {
            print(error)
            return
            
        }
        //let textFieldInsideUISearchBarLabel = textFieldInsideUISearchBar!.valueForKey("Search by Class") as? UILabel
        //textFieldInsideUISearchBarLabel?.textColor = UIColor.whiteColor()
        
        //SearchBar Placeholder text
        
        let searchBar = UISearchBar()
        
        self.searchController.searchBar.placeholder = "Search by Class"
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.active {
            return searchResults.count
        }
        return MyTutee.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cellIdentifier = "TuteeCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AllTuteeTableViewCell
        
        var student : TuteeObject!
        
        if searchController.active {
            student = searchResults[indexPath.row]
        }
        else {
            student = MyTutee[indexPath.row]
        }
        
        cell.locName?.text = student.iLocation
        cell.name?.text = student.iName
        cell.className?.text = student.iClass
        cell.time?.text = student.iTime
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if searchController.active {
            return false
        }
        else {
            // Return false if you do not want the specified item to be editable.
            return true
        }
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = MyTutee.filter({ (title: TuteeObject) -> Bool in
            //            let nameMatch = title.iName.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            //            let timeMatch = title.iTime.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            //            let locMatch = title.iLocation.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let classMatch = title.iClass.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            return classMatch != nil
        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText)
            tableView.reloadData()
        }
    }
    
    
    
    
    
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
