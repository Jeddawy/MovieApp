//
//  BaseClass.swift
//
//  Created by Ibrahim El-geddawy on 8/22/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class ReviewsBaseResponse: Mappable{

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let totalPages = "total_pages"
    static let page = "page"
    static let id = "id"
    static let results = "results"
    static let totalResults = "total_results"
  }

  // MARK: Properties
  public var totalPages: Int?
  public var page: Int?
  public var id: Int?
  public var results: [Results]?
  public var totalResults: Int?

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
    totalPages <- map[SerializationKeys.totalPages]
    page <- map[SerializationKeys.page]
    id <- map[SerializationKeys.id]
    results <- map[SerializationKeys.results]
    totalResults <- map[SerializationKeys.totalResults]
  }

}
