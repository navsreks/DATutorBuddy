//
//  ClassesTableViewCell.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally, Madhura Bhat, Urian Chang, Terry Tzeng on 11/30/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class ClassesTableViewCell: UITableViewCell {

    @IBOutlet var ClassName: UILabel!
    @IBOutlet var ClassDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
