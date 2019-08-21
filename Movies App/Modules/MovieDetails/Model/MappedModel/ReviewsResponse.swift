//
//  ReviewsResponse.swift
//
//  Created by Ibrahim El-geddawy on 8/22/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class ReviewsResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let content = "content"
    static let author = "author"
    static let id = "id"
    static let url = "url"
  }

  // MARK: Properties
  public var content: String?
  public var author: String?
  public var id: String?
  public var url: String?

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
    content <- map[SerializationKeys.content]
    author <- map[SerializationKeys.author]
    id <- map[SerializationKeys.id]
    url <- map[SerializationKeys.url]
  }

}
