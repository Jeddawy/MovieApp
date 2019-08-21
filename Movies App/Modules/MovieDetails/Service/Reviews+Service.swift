//
//  Reviews+Service.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

extension APIManager {
    
    static func getReviews(id: Int, successCompletionHandler: @escaping ([ReviewsResponse]?) -> Void,
                           failureCompletionHandler: @escaping (String) -> Void){
        let url = Movie.reviews(id).get()
        let param : [String : Any] = [
            "api_key" : Keys.API_KEY
        ]
        
        Alamofire.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).validate().responseObject { (response:DataResponse<ReviewsBaseResponse>) in
            switch response.result {
            case .failure(let error):
                failureCompletionHandler(error.localizedDescription)
            case .success(let value):
                if let result = value.results {
                    successCompletionHandler(result)
                }else {
                    failureCompletionHandler("timeout connection")
                }
            }
        }
    }
    
}
