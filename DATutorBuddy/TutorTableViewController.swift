//
//  TutorTableViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 11/30/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class TutorTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var Classes = ["CIS 55", "CIS 35A", "CIS 22A", "CIS 22B", "CIS 22C", "CIS35B"]

    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController!

    var MyTutee: [TuteeObject] = []

    var index : Int!
    var searchController : UISearchController!
    var searchResults : [TuteeObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Class Waitlist"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 0.1529, green: 0.4902, blue: 0.5569, alpha: 1.0)]
        
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //print(index)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
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
        var rowCount = 0
            
        for (var i = 0; i < MyTutee.count; i++) {
                
            var student : TuteeObject!
                
            student = MyTutee[i]
            if (student.iClass == Classes[index]) {
                rowCount = rowCount + 1
            }
        }
        return rowCount
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TutorsCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TutorTableViewCell
        var student : TuteeObject!
        
        student = MyTutee[indexPath.row]
        
        var studentTest : TuteeObject!
        var nameArr = [String]()
        var locArr = [String]()
        var dateArr = [String]()
        
        for (var i = 0; i < MyTutee.count; i++) {
            studentTest = MyTutee[i]
            if (studentTest.iClass == Classes[index]) {
                nameArr.append(String(studentTest.iName))
                locArr.append(studentTest.iLocation)
                dateArr.append(studentTest.iTime)
            }
        }
        cell.TutorName?.text = nameArr[indexPath.row]
        cell.TutorTeaching?.text = locArr[indexPath.row]
        cell.TutorTime?.text = dateArr[indexPath.row]

        
        cell.accessoryType = UITableViewCellAccessoryType.None
        UIView.animateWithDuration(3, animations: {cell.alpha = 1})
        cell.alpha = 0
        //Configure the cell...
        return cell
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            // Delete the row from the data source
            let itemToDelete = frc.objectAtIndexPath(indexPath) as! TuteeObject
            moc.deleteObject(itemToDelete)
            
            do {
                try moc.save()
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
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
    
/* segue code no longer needed after adding core data */
     if (segue.identifier == "addTutee")
     {
        var newItem = TuteeObject.self
        var addViewController = segue.destinationViewController as! AddTuteeViewController
        addViewController.className = Classes[index]
        //addViewController.NewTutee = addData
    }
 }
    func addData (newItem: TuteeObject) {
        MyTutee.append(newItem)
    }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = MyTutee.filter({ (title: TuteeObject) -> Bool in
            let nameMatch = title.iName.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let timeMatch = title.iTime.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let locMatch = title.iLocation.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let classMatch = title.iClass.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            return nameMatch != nil
//            return timeMatch != nil
//            return locMatch != nil
//            return classMatch != nil



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
        MyTutee = controller.fetchedObjects as! [TuteeObject]
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
}
