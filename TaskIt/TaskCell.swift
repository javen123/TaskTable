//
//  TaskCell.swift
//  TaskIt
//
//  Created by Eliot Arntz on 9/21/14.
//  Copyright (c) 2014 BitFountain. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var myCell: UIView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCell.backgroundColor = UIColor.clearColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
