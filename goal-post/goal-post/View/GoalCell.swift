//
//  GoalCell.swift
//  goal-post
//
//  Created by Gurpreet Bhoot on 7/16/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var goalNameLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(name: String, type: String, goalProgressAmount: Int) {
        self.goalNameLbl.text = name
        self.goalTypeLbl.text = type
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
    }
}
