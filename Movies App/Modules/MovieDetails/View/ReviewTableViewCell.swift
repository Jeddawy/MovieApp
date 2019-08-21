//
//  ReviewTableViewCell.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    static let ID = "ReviewTableViewCell"

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
