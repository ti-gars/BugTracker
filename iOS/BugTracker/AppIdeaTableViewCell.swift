//
//  AppIdeaTableViewCell.swift
//  BugTracker
//
//  Created by Charles-Olivier Demers on 15-10-06.
//  Copyright © 2015 Charles-Olivier Demers. All rights reserved.
//

import UIKit

class AppIdeaTableViewCell: UITableViewCell {

    @IBOutlet weak var ideaNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
