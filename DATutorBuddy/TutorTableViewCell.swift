//
//  TutorTableViewCell.swift
//  DATutorBuddy
//
//  Created by Navya Rekapally on 11/30/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class TutorTableViewCell: UITableViewCell {

    //@IBOutlet var TutorImage: UIImageView!
    @IBOutlet var TutorTeaching: UILabel!
    @IBOutlet var TutorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
