//
//  ApptObject.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/6/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class ApptObject: NSManagedObject {
    @NSManaged var name : String
    @NSManaged var subject : String
    @NSManaged var time : String
    @NSManaged var date : String
    @NSManaged var email : String
    @NSManaged var pNum : String
    @NSManaged var check : NSNumber

}
