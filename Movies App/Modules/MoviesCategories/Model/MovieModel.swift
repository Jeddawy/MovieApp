//
//  MovieModel.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

class CategoryTableViewCellModel {
    var title : String!
    var endPoint : String!
    init(title: String, endPoint: String){
        self.title = title
        self.endPoint = endPoint
    }
}
struct MovieModel {
    
    // MARK: Properties
    var posterPath: String!
     var backdropPath: String!
     var genreIds: [Int]!
     var voteCount: Int!
     var overview: String!
     var originalTitle: String!
     var popularity: Float!
     var releaseDate: String!
     var id: Int!
     var video: Bool! = false
     var originalLanguage: String!
     var voteAverage: Int!
     var title: String!
     var adult: Bool! = false
    init(movie: MovieResponse){
        if let posterPath = movie.posterPath{
            self.posterPath = "http://image.tmdb.org/t/p/w185/" + posterPath
        }
        if let backPath = movie.backdropPath{
            self.backdropPath = "http://image.tmdb.org/t/p/w185/" + backPath
        }
        self.genreIds = movie.genreIds
        self.voteCount = movie.voteCount
        self.overview = movie.overview
        self.originalTitle = movie.originalTitle
        self.popularity = movie.popularity
        self.releaseDate = movie.releaseDate
        self.id = movie.id
        self.video = movie.video
        self.originalLanguage = movie.originalLanguage
        self.voteAverage = movie.voteAverage
        self.title = movie.title
        self.adult = movie.adult
    }
}
