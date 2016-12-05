//
//  TutorTableViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 11/30/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class TutorTableViewController: UITableViewController, UISearchResultsUpdating {
    
//    var Tutee = ["Navya", "Madhura", "Terry", "Urian", "Manish"]
//    var Location = ["A37", "B32", "D21", "D2", "B15"]
//    var Time = ["2:00 pm", "1:00 pm", "4:00 pm", "3:00 pm", "1:30 pm"]
//    //var TutorPic = ["alladin.jpg", "bugsLife.jpg", "beautyAndTheBeast.jpg", "bigHero.jpg", "nemo.jpg"]
//    var Check = [false, false, false, false, false]
//    //var test = ["CIS55" : ["Madhura", "name"], "CIS22" : ["Navya"]]
    
    var MyTutee = [
        TuteeObject(iName: "Navya", iLocation: "A37", iTime: "2:00 pm", iClass: "CIS55", iCheck: false ),
        TuteeObject(iName: "Madhura", iLocation: "B32", iTime: "1:00 pm", iClass: "CIS22A", iCheck: false ),
        TuteeObject(iName: "Terry", iLocation: "D21", iTime: "4:00 pm", iClass: "CIS22B", iCheck: false ),
        TuteeObject(iName: "Urian", iLocation: "D2", iTime: "3:00 pm", iClass: "CIS22C", iCheck: false ),
        TuteeObject(iName: "Manish", iLocation: "B15", iTime: "1:30 pm", iClass: "CIS35A", iCheck: false )

    ]
    var index : Int!
    var searchController : UISearchController!
    var searchResults : [TuteeObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //print(index)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchBar.sizeToFit()
        self.searchController.hidesNavigationBarDuringPresentation = false;
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = self.searchController.searchBar
        
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
            return MyTutee.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TutorsCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TutorTableViewCell
        
        var student : TuteeObject!
        if searchController.active {
            student = searchResults[indexPath.row]
        }
        else {
            student = MyTutee[indexPath.row]
        }

        
         //Configure the cell...
        cell.TutorName?.text = student.iName
        cell.TutorTeaching?.text = student.iLocation
      //  cell.TutorImage?.image = UIImage(named: TutorPic[index])
        cell.alpha = 0
        UIView.animateWithDuration(10, animations: {cell.alpha = 1})
        
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

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        MyTutee.removeAtIndex(indexPath.row)
//        Location.removeAtIndex(indexPath.row)
//        Time.removeAtIndex(indexPath.row)
//     //   TutorPic.removeAtIndex(indexPath.row)
//        Check.removeAtIndex(indexPath.row)
        
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


//    // MARK: - Navigation
// override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// // Get the new view controller using segue.destinationViewController.
// // Pass the selected object to the new view controller.
// // Get the new view controller using segue.destinationViewController.
// // Pass the selected object to the new view controller.
// if (segue.identifier == "selectTutor")
// {
// if let indPath = self.tableView.indexPathForSelectedRow
// {
// let detailViewController = segue.destinationViewController as! TutorDetailViewController
// 
// 
// 
// }
// }
// }
    
    func filterContentForSearchText(searchText: String) {
        searchResults = MyTutee.filter({ (title: TuteeObject) -> Bool in
            let nameMatch = title.iName.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let timeMatch = title.iTime.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let locMatch = title.iLocation.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let classMatch = title.iClass.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            //return nameMatch != nil
            return timeMatch != nil
            return locMatch != nil
            return classMatch != nil



        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContentForSearchText(searchText)
            tableView.reloadData()
        }
    }
}
