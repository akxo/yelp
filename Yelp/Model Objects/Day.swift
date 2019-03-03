//
//  Day.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct Day: Decodable {
    let day: Int
    let start: String
    let end: String
    let isOvernight: Bool
}
