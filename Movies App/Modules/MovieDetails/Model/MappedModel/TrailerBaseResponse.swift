//
//  VideosBaseResponse.swift
//
//  Created by Ibrahim El-geddawy on 8/22/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

 class TrailerBaseResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let results = "results"
  }

  // MARK: Properties
  public var id: Int?
  public var results: [TrailerResponse]?

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
    id <- map[SerializationKeys.id]
    results <- map[SerializationKeys.results]
  }

}
