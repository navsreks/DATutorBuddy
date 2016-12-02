//
//  AllTuteeTableViewCell.swift
//  DATutorBuddy
//
//  Created by Madhura  Bhat on 12/2/16.
//  Copyright © 2016 DeAnza. All rights reserved.
//

import UIKit

class AllTuteeTableViewCell: UITableViewCell {
    
    @IBOutlet var locName: UILabel!

    @IBOutlet var name: UILabel!
    
    @IBOutlet var className: UILabel!
    
    @IBOutlet var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
