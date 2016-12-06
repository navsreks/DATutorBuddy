//
//  AddApptViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/6/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AddApptViewController: UIViewController {

    @IBOutlet var addpNum: UITextField!
    @IBOutlet var addEmail: UITextField!
    @IBOutlet var addTime: UITextField!
    @IBOutlet var addDate: UITextField!
    @IBOutlet var addClass: UITextField!
    @IBOutlet var addName: UITextField!
    
    var newAppt : ApptObject!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)

    }

    @IBAction func Save(sender: AnyObject) {
        let mymanagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        newAppt = NSEntityDescription.insertNewObjectForEntityForName("ApptObject", inManagedObjectContext: mymanagedObjectContext) as! ApptObject
        
        print(NSStringFromClass(newAppt.classForCoder))
        
        newAppt.name = addName.text!
        newAppt.subject = addClass.text!
        newAppt.date = addDate.text!
        newAppt.time = addTime.text!
        newAppt.email = addEmail.text!
        newAppt.pNum = addpNum.text!

        newAppt.check = 0
        
        do {
            try mymanagedObjectContext.save()
            
        }
        catch {
            print(error)
            return
            
        }
        self.dismissViewControllerAnimated(Bool(true), completion: nil)
    }
}
