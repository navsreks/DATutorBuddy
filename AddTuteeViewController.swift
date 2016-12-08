//
//  AddTuteeViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class AddTuteeViewController: UIViewController {

    @IBOutlet var addName: UITextField!
    @IBOutlet var addLocation: UITextField!
    @IBOutlet var addTime: UITextField!
    var className : String = ""
   /* class Date {
        let calendar = NSCalendar.currentCalendar()
        var day: Int {
            return  calendar.component(.Day, fromDate: NSDate())
        }
        var hour: Int {
            return calendar.component(.Hour, fromDate: NSDate())
        }
        var minutes: Int {
            return calendar.component(.Minute, fromDate:NSDate())
        }
    }
    */
     let date = NSDate()
     var calendar = NSCalendar.currentCalendar()
     var components : Int {
     return calendar.component([.Hour, .Minute], fromDate: date)
     }
     var hour : Int {
     return calendar.component(.Hour, fromDate: date)
     }
     var minute : Int {
     return calendar.component(.Minute, fromDate: date)
     }
    

    var NewTutee : TuteeObject!
    
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

    @IBAction func CancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func SaveButton(sender: AnyObject) {
//                self.NewTutee?.iName = self.addName.text!
//                self.NewTutee?.iLocation = self.addLocation.text!
//                self.NewTutee?.iTime = self.addTime.text!
//                self.NewTutee?.iClass = self.addClass.text!
        //NewTutee (TuteeObject(iName: self.addName.text, iTime: self.addTime.text, iLocation: self.addLocation.text, iClass: self.addClass.text))
        let myMOC = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        NewTutee = NSEntityDescription.insertNewObjectForEntityForName("TuteeObject", inManagedObjectContext: myMOC) as! TuteeObject
        
        if(addName.text == "" || addLocation.text == "") {
            
            let alertController = UIAlertController(title: "Alert!!!", message:
                "Please fill in both your Name and Seat Location.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else if(addName.text!.characters.count > 10){
         
         let alertController = UIAlertController(title: "Alert!!!", message:
         "Please enter a nickname if your name exceeds 10 characters. Thank you.", preferredStyle: UIAlertControllerStyle.Alert)
         alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
         
         self.presentViewController(alertController, animated: true, completion: nil)
         
         }
        else if(addLocation.text!.characters.count > 4){
            
            let alertController = UIAlertController(title: "Alert!!!", message:
                "Use last 3 characters of your Seat Location. Example: If sticker on monitor reads ATC203-M01, enter only M01.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        else{
        
        print(NSStringFromClass(NewTutee.classForCoder))
        NewTutee.iName = addName.text!
        NewTutee.iClass = className
        //NewTutee.iTime = addTime.text!
        NewTutee.iTime = String(hour) + ":" + String(minute)
        NewTutee.iLocation = addLocation.text!
        
            do {
                try myMOC.save()
                
            }
            catch {
                print(error)
                return
                
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
