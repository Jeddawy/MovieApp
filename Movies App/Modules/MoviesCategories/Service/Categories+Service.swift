//
//  Categories+Service.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class APIManager: NSObject{
    
    static func getMovieCategory(category: String,page: Int, successCompletionHandler: @escaping ([MovieResponse]?,Int) -> Void,
                                 failureCompletionHandler: @escaping (String) -> Void){
        let url = Movie.category(category).get()
        print(url)
        let param : [String : Any] = [
//            "page" : page,
            "api_key" : Keys.API_KEY
        ]
        
        Alamofire.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).validate().responseObject { (response:DataResponse<MovieCategoryResponse>) in
            switch response.result {
            case .failure(let error):
                failureCompletionHandler(error.localizedDescription)
            case .success(let value):
                if let result = value.results, let pagesCount = value.totalPages {
                    successCompletionHandler(result, pagesCount)
                }else {
                    failureCompletionHandler("timeout connection")
                }
            }
        }
//        APIManager.requestWithPages(url, method: .get, parameters: nil, page: page, successCompletionHandler: { (data: [MovieResponse]?) in
//            successCompletionHandler(data ?? [MovieResponse]())
//        }, failureCompletionHandler: <#T##(String) -> Void#>)
        
    }
    
}
