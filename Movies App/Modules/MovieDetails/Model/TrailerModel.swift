//
//  TrailerModel.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

struct TrailerModel {
     var name: String!
     var id: String!
     var key: String!
     var iso31661: String!
     var size: Int!
     var iso6391: String!
     var type: String!
     var site: String!
    init(trailer: TrailerResponse){
        self.name = trailer.name
        self.id = trailer.id
        self.key = trailer.key
        self.iso31661 = trailer.iso31661
        self.size = trailer.size
        self.iso6391 = trailer.iso6391
        self.type = trailer.type
        self.site = trailer.site
    }
}
