//
//  Config.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/20/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

struct Keys {
    static let API_KEY = "e1a60fc4034e07dd4f2ed0140a228664"
}

struct Urls {
    static let main = "http://api.themoviedb.org/3/movie"
}

enum Movie {
    case category(_ category: String)
    case videos(_ id: Int)
    case reviews(_ id: Int)
    func get()->String{
        switch self {
        case .category(let value):
            return Urls.main + "/\(value)"
        case .videos(let id):
            return Urls.main + "/\(id)" + "videos"
        case .reviews(let id):
            return Urls.main + "/\(id)" + "reviews"
        }
    }
}
