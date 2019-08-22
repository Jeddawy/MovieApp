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
    fileprivate var trailers : [TrailerModel] = [TrailerModel](){
        didSet {
            self.refreshClosure?()
        }
    }
    fileprivate var reviews : [ReviewsModel] = [ReviewsModel](){
        didSet{
            self.refreshClosure?()
        }
    }
    
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

}

//Trailer Data
extension MovieDetailsViewModel{
    
    private func getTrailers(id: Int){
        self.trailers.removeAll()
        APIManager.getTrailer(id: id, successCompletionHandler: { (trailers) in
            guard let trailers = trailers else {return}
            var trailerArray = [TrailerModel]()
            for trailer in trailers {
                trailerArray.append(TrailerModel(trailer: trailer))
            }
            self.trailers += trailerArray
        }) { (error) in
            self.alertMessage = error
        }
    }
    
    func trailersCount() -> Int {
        return self.trailers.count
    }
    
    func getTrailer(atIndex index: Int)->TrailerModel?{
        if (index >= 0 && index < trailers.count){
            return self.trailers[index]
        }
        return nil
    }
    
    func didTapTrailer(atIndex index:Int){
        if let trailer = self.getTrailer(atIndex: index){
            Helper.playInYoutube(youtubeId: trailer.id)
        }
    }
    
}

//Reviews Data
extension MovieDetailsViewModel{
    
    private func getReviews(id: Int){
        self.reviews.removeAll()
        APIManager.getReviews(id: id, successCompletionHandler: { (reviews) in
            guard let reviews = reviews else {return}
            var reviewArray = [ReviewsModel]()
            for review in reviews {
                reviewArray.append(ReviewsModel(review: review))
            }
            self.reviews += reviewArray
        }) { (error) in
            self.alertMessage = error
        }
    }
    
    func reviewsCount() -> Int {
        return self.reviews.count
    }
    
    func getReview(atIndex index: Int)->ReviewsModel?{
        if (index >= 0 && index < trailers.count){
            return self.reviews[index]
        }
        return nil
    }
}

