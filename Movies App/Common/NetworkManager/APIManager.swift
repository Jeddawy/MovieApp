//
//  APIManager.swift
//  DoseFit-iOS
//
//  Created by ahmedbahnasy on 7/24/18.
//  Copyright © 2018 AhmedBahnasy. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class APIManager: NSObject {

    static var lang:String = "en"
//    static var token:String? = Helper.userToken()
    //Development and Team AuthorizationKey

//    static let testToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJodHRwOi8vMzUuMTk2LjcuMTUiLCJpc3MiOiJodHRwOi8vMzUuMTk2LjcuMTUiLCJzdWIiOjE4Mywic3ViX3R5cCI6IkNsaWVudCIsImV4cCI6MTU4MjcxMjYwNCwiaWF0IjoxNTUxMTc2NjA0LCJqdGkiOiJhMmVjMzU5MTAwMzVhYjA0ZTYyNyJ9.gWtl0XmgjLzlEIzkPgJeTUIh05Kjuzg3DCXBSrtG5q8"
//    static let token = Helper.getAccessToken()

    static var header: [String: String] {
        get {
            return [
//                "Accept": "application/json",
//                    "country": "AE",
                    "api-key": Keys.API_KEY,
//                    "Accept-Language": lang,
                //add Authoe\rization KEy
//                "Authorization": "

            ]
        }
    }

//    static var authorizedHeader: [String: String] {
//        get {
//            return ["Accept": "application/json",
//                    "Accept-Language": "en",
////                    "Authorization": "Bearer \(Helper.userToken() ?? "N/A")"
//            ]
//        }
//    }

//    static func request<Z: BaseMappable>(_ url: URLConvertible,
//                                         method: HTTPMethod = .get,
//                                         parameters: Parameters? = nil,
//                                         completionHandler: @escaping (DataResponse<Z>) -> Void){
//        print("---> url \(url)")
//        print("---> Parameters \(String(describing: parameters?.description))")
//        print("---> header \(header)")
//
//        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: header).responseObject(completionHandler: completionHandler)
//
//    }
//
//    static func baseArrayRequestWithCompletion<T: BaseResponse<U>, U: Mappable>(_ url: URLConvertible,
//                                                                                     method: HTTPMethod = .get,
//                                                                                     parameters: Parameters? = nil,
//                                                                                     successCompletionHandler: (([U]?) -> Void)?, failureCompletionHandler: @escaping (String) -> Void){
//        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: header).responseObject { (response:DataResponse<T>) in
//
//            let returnData = String(data: response.data!, encoding: .utf8)
//            print("---> baseRequestWithCompletion \(url) resposne = \(returnData)")
//
//            parseResponse(response.result, successCompletionHandler: { (data) in
//                successCompletionHandler?(data)
//            }, failureCompletionHandler: { (error) in
//                failureCompletionHandler(error)
//            })
//        }
//    }
////    static func baseRequestWithCompletion<T: BaseResponse<U>, U: Mappable>(_ url: URLConvertible,
////                                         method: HTTPMethod = .get,
////                                         parameters: Parameters? = nil,
////                                         successCompletionHandler: ((U?) -> Void)?, failureCompletionHandler: @escaping (String) -> Void){
////        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: header).responseObject { (response:DataResponse<T>) in
////
////                let returnData = String(data: response.data!, encoding: .utf8)
////                print("---> baseRequestWithCompletion \(url) resposne = \(returnData)")
////
////            parseResponse(response.result, successCompletionHandler: { (data) in
////                successCompletionHandler?(data)
////            }, failureCompletionHandler: { (error) in
////                failureCompletionHandler(error)
////            })
////        }
////
////    }
//
//    static func requestWithPages<T: BaseResponse<U>, U: Mappable>(_ url: URLConvertible,
//                                         method: HTTPMethod = .get,
//                                         parameters: Parameters? = nil,
//                                         page:Int,
////                                         pageSize:Int, searchQuery: String,
//                                         successCompletionHandler: (([U]?) -> Void)?, failureCompletionHandler: @escaping (String) -> Void){
//
//        var requestParameters = [String:Any]()
//        requestParameters["page"] = page
////        requestParameters["per_page"] = pageSize
////        requestParameters["q"] = searchQuery
//
//        if let parameters = parameters{
//            requestParameters.merge(parameters)
//        }
//        APIManager.baseArrayRequestWithCompletion(url,method: method, parameters: requestParameters, successCompletionHandler: successCompletionHandler, failureCompletionHandler: failureCompletionHandler)
//
//    }
//
//
////    let returnData = String(data: response.data!, encoding: .utf8)
////    print("---> events resposne = \(returnData)")
//
////    static func parseResponse<T: BaseResponse<U>, U: Mappable>(_ result:Result<T>, successCompletionHandler: ((U?) -> Void)?, failureCompletionHandler: @escaping (String) -> Void){
////
////        switch result {
////            case .failure(let error):
////                print("parseResponse ---> failure ---> \(error.localizedDescription)")
////                failureCompletionHandler(error.localizedDescription)
////            case .success(_):
//////                if let errorMessage = result.value?.message{
//////
//////                    print("parseResponse ---> success error ---> \(errorMessage)")
//////                    failureCompletionHandler(errorMessage)
//////
//////                }else if let status = result.value?.message, status != "success" {
//////                    print("parseResponse ---> success unknown Error")
//////                    failureCompletionHandler("Unknown server error")
//////
//////                }else{
////                    //TODO we need t o fix this condition
////                    print("the response result \(result.value?.results)")
////                    successCompletionHandler?(result.value?.results)
//////                }
////        }
////    }
//    static func parseResponse<T: BaseResponse<U>, U: Mappable>(_ result:Result<T>, successCompletionHandler: (([U]?) -> Void)?, failureCompletionHandler: @escaping (String) -> Void){
//
//        switch result {
//        case .failure(let error):
//            print("parseResponse ---> failure ---> \(error.localizedDescription)")
//            failureCompletionHandler(error.localizedDescription)
//        case .success(_):
////            if let errorMessage = result.value?.errors{
////
////                print("parseResponse ---> success error ---> \(errorMessage)")
////                failureCompletionHandler(errorMessage.first ?? "Error")
////
////            }else if let status = result.value?.status, status != "success" {
////                print("parseResponse ---> success unknown Error")
////                failureCompletionHandler("Unknown server error")
////
////            }else{
//                //TODO we need t o fix this condition
//                print("the response result \(result.value?.results)")
//                successCompletionHandler?(result.value?.results)
////            }
//        }
//    }

}
