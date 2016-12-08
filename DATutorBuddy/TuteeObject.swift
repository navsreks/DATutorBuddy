//
//  TuteeObject.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally, Madhura Bhat, Urian Chang, Terry Tzeng on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit
import CoreData

class TuteeObject: NSManagedObject {
    @NSManaged var iName : String
    @NSManaged var iLocation : String
    @NSManaged var iTime : String
    @NSManaged var iClass : String
    @NSManaged var iCheck : NSNumber
//    init(iName: String, iLocation: String, iTime: String, iClass: String, iCheck: Bool)
//    {
//        self.iName = iName
//        self.iLocation = iLocation
//        self.iTime = iTime
//        self.iClass = iClass
//        self.iCheck = iCheck
//    }
}
