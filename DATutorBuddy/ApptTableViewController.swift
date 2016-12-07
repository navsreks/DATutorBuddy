//
//  ApptTableViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/6/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class ApptTableViewController: UITableViewController, UISearchResultsUpdating, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var fetchedResultsController : NSFetchedResultsController!
    
    var MyAppt: [ApptObject] = []
    
    var searchController : UISearchController!
    var searchResults : [ApptObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = " Future Appointments"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 0.1529, green: 0.4902, blue: 0.5569, alpha: 1.0)]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let fetchRequest = NSFetchRequest(entityName: "ApptObject")
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        
        do {
            try fetchedResultsController.performFetch()
            MyAppt = fetchedResultsController.fetchedObjects as! [ApptObject]
            
        }
        catch {
            print(error)
            return
            
        }
        
        navigationItem.backBarButtonItem = UIBarButtonItem (title: "", style: .Plain, target: nil, action: nil)
        
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        self.searchController.hidesNavigationBarDuringPresentation = false;
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = self.searchController.searchBar
    }

    override func viewDidAppear(animated: Bool) {
        
        let fetchRequest = NSFetchRequest(entityName: "ApptObject")
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        
        do {
            try fetchedResultsController.performFetch()
            MyAppt = fetchedResultsController.fetchedObjects as! [ApptObject]
            
        }
        catch {
            print(error)
            return
            
        }
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
        else {
            return MyAppt.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ApptCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ApptTableViewCell
        
        var cinema : ApptObject!
        if searchController.active {
            cinema = searchResults[indexPath.row]
        }
        else {
            cinema = MyAppt[indexPath.row]
        }
        
        cell.cellDate?.text = cinema.date
        cell.cellName?.text = cinema.name
        cell.cellClass?.text = cinema.subject
        cell.accessoryType = cinema.check.boolValue ? .DisclosureIndicator : .None


        
        cell.alpha = 0
        UIView.animateWithDuration(3, animations: {cell.alpha = 1})
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = MyAppt[indexPath.row]
        //let msgAlert = UIAlertView(title: "Row Selected", message: selectedItem, delegate: nil, cancelButtonTitle: "ok")
        //msgAlert.show()
        
        //MyMovie[indexPath.row].check = !(MyMovie[indexPath.row].check)
        // if (MyMovie[indexPath.row].check)
        
        var reel = (searchController.active) ? searchResults[indexPath.row] : MyAppt[indexPath.row]
        reel.check = !(reel.check.boolValue)
        
        if (reel.check.boolValue){
            self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .DisclosureIndicator
        }
        else {
            self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .None
        }
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
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

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // MyMovie.removeAtIndex(indexPath.row)
            // tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            // Delete the row from the data source
            let itemToDelete = fetchedResultsController.objectAtIndexPath(indexPath) as! ApptObject
            managedObjectContext.deleteObject(itemToDelete)
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }  else if editingStyle == .Insert {
            
        }
        
        
        self.tableView.reloadData()
        
    }

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

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "ShowApptDetails")
        {
            if let indPath = self.tableView.indexPathForSelectedRow
            {
                let detailViewController = segue.destinationViewController as! ApptDetailViewController
                
                if searchController.active {
                    detailViewController.ApptDetail = searchResults[indPath.row]
                }
                else {
                    detailViewController.ApptDetail = MyAppt[indPath.row]
                }
            }
        }
    }
    func addData(newItem: ApptObject) {
        MyAppt.append(newItem)
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = MyAppt.filter({ (title: ApptObject) -> Bool in
            let classMatch = title.subject.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return classMatch != nil
        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText)
            tableView.reloadData()
        }
    }
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObjectandObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Fade)
            }
        case .Delete:
            if let _indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
        case.Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
        default:
            tableView.reloadData()
        }
        MyAppt = controller.fetchedObjects as! [ApptObject]
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}