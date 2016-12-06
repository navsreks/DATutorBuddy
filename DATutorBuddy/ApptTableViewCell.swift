//
//  ApptTableViewCell.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 12/6/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class ApptTableViewCell: UITableViewCell {

    @IBOutlet var cellDate: UILabel!
    @IBOutlet var cellClass: UILabel!
    @IBOutlet var cellName: UILabel!

        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
