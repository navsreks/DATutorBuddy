//
//  TutorTableViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 11/30/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class TutorTableViewController: UITableViewController {
    
    var Tutor = ["Navya", "Madhura", "Terry", "Urian", "Manish"]
    var ClassTeaching = ["iOS Development", "Java", "C++", "CIS 22B", "CIS 22C"]
    var TutorPic = ["alladin.jpg", "bugsLife.jpg", "beautyAndTheBeast.jpg", "bigHero.jpg", "nemo.jpg"]
    var Check = [false, false, false, false, false]
    var test = ["CIS55" : ["Madhura", "name"], "CIS22" : ["Navya"]]
    
    var index : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        print(index)
        
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
        return Tutor.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "TutorsCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TutorTableViewCell
        
        
         //Configure the cell...
        cell.TutorName?.text = Tutor[index]
        cell.TutorTeaching?.text = ClassTeaching[index]
        cell.TutorImage?.image = UIImage(named: TutorPic[index])
//
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        Tutor.removeAtIndex(indexPath.row)
        ClassTeaching.removeAtIndex(indexPath.row)
        TutorPic.removeAtIndex(indexPath.row)
        Check.removeAtIndex(indexPath.row)
        
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
 if (segue.identifier == "selectTutor")
 {
 if let indPath = self.tableView.indexPathForSelectedRow
 {
 let detailViewController = segue.destinationViewController as! TutorDetailViewController
 
 
 
 }
 }
 }

}
