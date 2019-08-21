//
//  TrailerResponse.swift
//
//  Created by Ibrahim El-geddawy on 8/22/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

class TrailerResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let id = "id"
    static let key = "key"
    static let iso31661 = "iso_3166_1"
    static let size = "size"
    static let iso6391 = "iso_639_1"
    static let type = "type"
    static let site = "site"
  }

  // MARK: Properties
  public var name: String?
  public var id: String?
  public var key: String?
  public var iso31661: String?
  public var size: Int?
  public var iso6391: String?
  public var type: String?
  public var site: String?

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
    name <- map[SerializationKeys.name]
    id <- map[SerializationKeys.id]
    key <- map[SerializationKeys.key]
    iso31661 <- map[SerializationKeys.iso31661]
    size <- map[SerializationKeys.size]
    iso6391 <- map[SerializationKeys.iso6391]
    type <- map[SerializationKeys.type]
    site <- map[SerializationKeys.site]
  }

}
