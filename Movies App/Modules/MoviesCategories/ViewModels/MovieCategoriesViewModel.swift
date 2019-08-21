//
//  MovieCategoriesViewModel.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

class MovieCategoriesViewModel: BaseViewModel {
    
    var reloadTableViewClosure: (()->())?
    //    var showAlertClosure: (()->())?
    var updateLoadingStatus: (()->())?
    fileprivate var cellIndexPath: IndexPath = IndexPath()
    fileprivate var categoriesArray : [CategoryTableViewCellModel] = [CategoryTableViewCellModel(title: "Popular", endPoint: "popular"), CategoryTableViewCellModel(title: "Upcomming", endPoint: "upcoming"), CategoryTableViewCellModel(title: "Top Rated", endPoint: "top_rated")]
    
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

    fileprivate var moviesCategory : [MovieModel] = [MovieModel](){
        didSet {
            self.refreshClosure?(self.cellIndexPath)
        }
    }
    
    //    func reloadItemsFromFirstPage(){
    //        self.moviesCategory.removeAll()
    //        self.currentPage = 0
    //        self.totalPages = 1
    //        self.loadNextPage()
    //    }
    var currentPage = 0
    var totalPages = 1
    let pageSize = 20
    
   
    
    
//}
////Movie Categorye Data
//
//extension MovieCategoriesViewModel {

    var moviesCount: Int {
        return moviesCategory.count
    }
    
    func getMovie(atIndex index:Int) -> MovieModel?{
        if(index >= 0 && index < moviesCategory.count){
            return moviesCategory[index]
        }
        return nil
    }
    var movieDetailsClosure: ((_ movie: MovieModel)->())?
    func didTapMovieCell(atIndex index: Int){
        if let movie = self.getMovie(atIndex: index){
            self.movieDetailsClosure?(movie)
        }
    }
    
    //    func loadNextPage(){
    //        self.showLoader()
    //        print("---> loadNextPage")
    //        if(currentPage >= totalPages){
    //            print("---> loadNextPage no data")
    ////            alertMessage = "NoMoreDateKey".localized
    //        } else {
    //            self.hideLoader()
    ////            self.isLoading = true
    //            let successHandler: ([MovieModel],Int)->Void = { items, totalPages in
    //                print("---> loadNextPage did load success \(items.count)")
    //                self.currentPage += 1
    //                self.totalPages = totalPages
    ////                self.isLoading = false
    //                self.moviesCategory += items
    //            }
    //            let failureHandler: (String)->Void = { error in
    //                print("---> did load with error \(error)")
    ////                self.isLoading = false
    //                self.alertMessage = error
    //            }
    //
    //            self.loadItems(page: self.currentPage + 1, successCompletion: successHandler, failureCompletion: failureHandler)
    //
    //        }
    //    }
    //
    //    func loadItems(page:Int, successCompletion: @escaping ([MovieModel],Int) -> Void, failureCompletion: @escaping (String) -> Void){
    //    }
    func getMovies(endPoint: String){
        showLoader()
        self.moviesCategory.removeAll()
        APIManager.getMovieCategory(category: endPoint, page: 0, successCompletionHandler: { (movies, totalPages) in
            if let moviesCategory = movies {
                var movieArray = [MovieModel]()
                for movie in moviesCategory {
                    movieArray.append(MovieModel(movie: movie))
                    //                self.moviesCategory += moviesCategory
                }
                self.hideLoader()
                self.moviesCategory += movieArray
                print(movieArray , "--------->", movieArray.count)
            }
        }
        ) { (error) in
            self.hideLoader()
            self.alertMessage = error
        }
        
    }
    
    //    func getPopularMovies(page: Int){
    //        APIManager.getPopularMovies(page: page, successCompletionHandler: { (movies, totalPages) in
    //            if let moviesCategory = movies {
    //                var movieArray = [MovieModel]()
    //                for movie in moviesCategory {
    //                    movieArray.append(MovieModel(movie: movie))
    //                    //                self.moviesCategory += moviesCategory
    //                }
    //                self.moviesCategory += movieArray
    //            }
    //        }
    //        ) { (error) in
    //            self.alertMessage = error
    //        }
    //
    //    }
}
