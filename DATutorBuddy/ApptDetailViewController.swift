//
//  ApptDetailViewController.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/6/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class ApptDetailViewController: UIViewController {

    @IBOutlet var pNum: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var subject: UILabel!
    @IBOutlet var name: UILabel!
    
    var ApptDetail: ApptObject!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.name.text = "Name: " + self.ApptDetail.name
        self.subject.text = "Class: " + self.ApptDetail.subject
        self.date.text = "Date: " + self.ApptDetail.date
        self.time.text = "Time: " + self.ApptDetail.time
        self.email.text = "Email: " + self.ApptDetail.email
        self.pNum.text = "Phone Number: " + self.ApptDetail.pNum


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

}
