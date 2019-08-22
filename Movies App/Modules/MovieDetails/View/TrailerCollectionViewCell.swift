//
//  VideosCollectionViewCell.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class TrailerCollectionViewCell: UICollectionViewCell {
    static let ID = "TrailerCollectionViewCell"
    
    @IBOutlet weak var trailerImageView: UIImageView!
    

    func bind(image: String){
        if let url = URL(string: image) {
            self.trailerImageView.sd_setImage(with: url, completed: nil)
        }
    }
}
