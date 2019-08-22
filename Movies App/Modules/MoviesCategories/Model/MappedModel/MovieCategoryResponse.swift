//
//  BaseClass.swift
//
//  Created by Ibrahim El-geddawy on 8/20/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class MovieCategoryResponse: Mappable {
    
    // MARK: Properties
    public var totalResults: Int?
    public var page: Int?
    public var results: [MovieResponse]?
    public var totalPages: Int?
    public var id : Int?
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
        totalResults <- map[SerializationKeys.totalResults]
        page <- map[SerializationKeys.page]
        results <- map[SerializationKeys.results]
        totalPages <- map[SerializationKeys.totalPages]
        id <- map[SerializationKeys.id]
    }
    
}

// MARK: Declaration for string constants to be used to decode and also serialize.
private struct SerializationKeys {
    static let totalResults = "total_results"
    static let page = "page"
    static let id = "id"
    static let results = "results"
    static let totalPages = "total_pages"
}
