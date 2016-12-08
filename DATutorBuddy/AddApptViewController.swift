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
        
        if(addName.text == "" || addClass.text == "" || addDate.text == "" || addEmail.text == "" || addTime.text == "") {
            
            let alertController = UIAlertController(title: "Alert!!!", message:
                "Only phone number is optional. Please fill in all other information.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if(addName.text!.characters.count > 10){
            
            let alertController = UIAlertController(title: "Alert!!!", message:
                "Please enter a nickname if your name exceeds 10 characters. Thank you.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else if(addDate.text!.characters.count > 7){
            
            let alertController = UIAlertController(title: "Alert!!!", message:
                "Please enter date in mo/day format. Example: January 31 as 01/31", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }

        else if(addClass.text!.characters.count > 7){
            
            let alertController = UIAlertController(title: "Alert!!!", message:
                "Use class code for Class Name. Example: If class is CIS22A Beginning C++, enter only CIS22A.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else{
            
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
}