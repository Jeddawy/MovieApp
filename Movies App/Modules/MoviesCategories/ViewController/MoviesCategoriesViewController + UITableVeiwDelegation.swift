//
//  MoviesCategoriesViewController + UITableVeiwDelegation.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import UIKit

extension MoviesCategoriesViewController: MovieCollectionViewDelegate {
    
    func getItemIndex(atIndex index: Int) -> MovieModel? {
        if let movie = viewModel.getMovie(atIndex: index){
            return movie
        }
        return nil
    }
    
    func didSelectCell(atIndex index: Int) {
        viewModel.didTapMovieCell(atIndex: index)
    }
    
    func itemsCount() -> Int {
        return viewModel.moviesCount()
    }
    
}
