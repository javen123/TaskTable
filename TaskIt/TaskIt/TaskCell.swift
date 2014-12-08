//
//  TaskCell.swift
//  TaskIt
//
//  Created by user on 10/8/14.
//  Copyright (c) 2014 Neva. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    //labels
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
