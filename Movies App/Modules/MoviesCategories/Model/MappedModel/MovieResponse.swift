//
//  Results.swift
//
//  Created by Ibrahim El-geddawy on 8/20/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

 class MovieResponse: Mappable{

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let posterPath = "poster_path"
    static let backdropPath = "backdrop_path"
    static let genreIds = "genre_ids"
    static let voteCount = "vote_count"
    static let overview = "overview"
    static let originalTitle = "original_title"
    static let popularity = "popularity"
    static let releaseDate = "release_date"
    static let id = "id"
    static let video = "video"
    static let originalLanguage = "original_language"
    static let voteAverage = "vote_average"
    static let title = "title"
    static let adult = "adult"
  }

  // MARK: Properties
  public var posterPath: String?
  public var backdropPath: String?
  public var genreIds: [Int]?
  public var voteCount: Int?
  public var overview: String?
  public var originalTitle: String?
  public var popularity: Float?
  public var releaseDate: String?
  public var id: Int?
  public var video: Bool? = false
  public var originalLanguage: String?
  public var voteAverage: Int?
  public var title: String?
  public var adult: Bool? = false

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
    posterPath <- map[SerializationKeys.posterPath]
    backdropPath <- map[SerializationKeys.backdropPath]
    genreIds <- map[SerializationKeys.genreIds]
    voteCount <- map[SerializationKeys.voteCount]
    overview <- map[SerializationKeys.overview]
    originalTitle <- map[SerializationKeys.originalTitle]
    popularity <- map[SerializationKeys.popularity]
    releaseDate <- map[SerializationKeys.releaseDate]
    id <- map[SerializationKeys.id]
    video <- map[SerializationKeys.video]
    originalLanguage <- map[SerializationKeys.originalLanguage]
    voteAverage <- map[SerializationKeys.voteAverage]
    title <- map[SerializationKeys.title]
    adult <- map[SerializationKeys.adult]
  }

}
