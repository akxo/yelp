//
//  Review.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct Review: Decodable {
    let id: String
    let rating: Int
    let user: User
    let text: String
    let timeCreated: String
    let url: String
}
