//
//  Category.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let alias: String
    let title: String
    let parentAliases: [String]
    let countryWhitelist: [String]
    let countryBlacklist: [String]
}
