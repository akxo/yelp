//
//  SpecialHour.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct SpecialHour: Decodable {
    let date: String
    let start: String
    let end: String
    let isOvernight: Bool
    let isClosed: Bool
}
