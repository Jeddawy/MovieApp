//
//  MovieCategoriesViewModel.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

class MovieCategoriesViewModel: BaseViewModel {
    
    fileprivate var cellIndexPath: IndexPath = IndexPath()
    fileprivate var categoriesArray : [CategoryTableViewCellModel] = [CategoryTableViewCellModel(title: "Popular", endPoint: "popular"), CategoryTableViewCellModel(title: "Upcomming", endPoint: "upcoming"), CategoryTableViewCellModel(title: "Top Rated", endPoint: "top_rated")]
    fileprivate var moviesCategory : [MovieModel] = [MovieModel](){
        didSet {
            self.refreshCollectionClosure?(self.cellIndexPath)
        }
    }
    
    //Closures
    var refreshCollectionClosure: ((_ indexPath: IndexPath)->())?
    var movieDetailsClosure: ((_ movie: MovieModel)->())?
    
    func getCategory(atIndex index: Int)-> CategoryTableViewCellModel?{
        if (index >= 0 && index < categoriesArray.count){
            return self.categoriesArray[index]
        }
        return nil
    }
    
    func didTapCategoryCell(atIndex index: Int, indexPath: IndexPath){
        if let endPoint = self.categoriesArray[index].endPoint {
            self.cellIndexPath = indexPath
            self.getMovies(endPoint: endPoint)
            print(endPoint)
        }
    }

  

}
//Movie Categorye Data

extension MovieCategoriesViewModel {
    
    func getMovies(endPoint: String){
        showLoader()
        self.moviesCategory.removeAll()
        APIManager.getMovieCategory(category: endPoint, page: 0, successCompletionHandler: { (movies, totalPages) in
            if let moviesCategory = movies {
                var movieArray = [MovieModel]()
                for movie in moviesCategory {
                    movieArray.append(MovieModel(movie: movie))
                }
                self.hideLoader()
                self.moviesCategory += movieArray
            }
        }
        ) { (error) in
            self.hideLoader()
            self.alertMessage = error
        }
    }
    
    var moviesCount: Int {
        return moviesCategory.count
    }
    
    func getMovie(atIndex index:Int) -> MovieModel?{
        if(index >= 0 && index < moviesCategory.count){
            return moviesCategory[index]
        }
        return nil
    }
    
    func didTapMovieCell(atIndex index: Int){
        if let movie = self.getMovie(atIndex: index){
            self.movieDetailsClosure?(movie)
        }
    }
}
