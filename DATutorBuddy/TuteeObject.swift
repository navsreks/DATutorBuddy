//
//  TuteeObject.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/5/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class TuteeObject: NSObject {
    var iName = ""
    var iLocation = ""
    var iTime = ""
    var iClass = ""
    var iCheck = false
    init(iName: String, iLocation: String, iTime: String, iClass: String, iCheck: Bool)
    {
        self.iName = iName
        self.iLocation = iLocation
        self.iTime = iTime
        self.iClass = iClass
        self.iCheck = iCheck
    }
}
