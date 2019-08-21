//
//  ReviewsModel.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/22/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

struct ReviewsModel {
     var content: String!
     var author: String!
     var id: String!
     var url: String!
    init(review: ReviewsResponse) {
        self.content = review.content
        self.author = review.author
        self.id = review.id
        self.url = review.url
    }
}
