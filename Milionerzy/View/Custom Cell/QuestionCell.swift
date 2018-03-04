//
//  QuestionCell.swift
//  Milionerzy
//
//  Created by Kamil Chmiel on 28.02.2018.
//  Copyright © 2018 Kamil Chmiel. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var cellText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
