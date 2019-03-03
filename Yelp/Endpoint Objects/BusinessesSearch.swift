//
//  BusinessesSearch.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct BusinessesSearch: Decodable {
    let total: Int
    let region: [String : Coordinates]
    let businesses: [Business]
}
