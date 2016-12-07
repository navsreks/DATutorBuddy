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
        
        print(NSStringFromClass(NewTutee.classForCoder))
        NewTutee.iName = addName.text!
        NewTutee.iClass = className
        NewTutee.iTime = addTime.text!
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
