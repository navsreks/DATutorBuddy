//
//  AddTuteeViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class AddTuteeViewController: UIViewController {

    @IBOutlet var details: UILabel!
    @IBOutlet var addLocation: UITextField!
    @IBOutlet var addClass: UITextField!
    @IBOutlet var addName: UITextField!
   
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
    }
}
