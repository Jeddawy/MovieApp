//
//  MovieDetailsViewModel.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

class MovieDetailsViewModel: BaseViewModel {
    
    fileprivate var movie: MovieModel!
    fileprivate var movieID: Int!
    
    init(movie: MovieModel){
        self.movie = movie
        self.movieID = movie.id
    }
    
    func movieDetails()->MovieModel{
        return self.movie
    }
    
    func setup(){
        getTrailers(id: self.movieID)
        getReviews(id: self.movieID)
    }
    
    func getTrailers(id: Int){
        
        
    }
    func getReviews(id: Int){
        
        
    }
    
}
