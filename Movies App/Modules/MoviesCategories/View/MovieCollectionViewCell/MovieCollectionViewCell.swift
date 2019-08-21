//
//  MovieCollectionViewCell.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/20/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {

    static let ID = "MovieCollectionViewCell"
    @IBOutlet weak var movieImageView: UIImageView!
    var id: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func bind(movie: MovieModel){
        self.bind(image: movie.posterPath)
    }
    private func bind(image: String){
        if let url = URL(string: image){
            print(url)
            movieImageView.sd_setImage(with: url, placeholderImage: nil)
        }
        
    }
    

}
