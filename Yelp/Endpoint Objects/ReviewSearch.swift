//
//  ReviewSearch.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/17/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct ReviewSearch: Decodable {
    public let reviews: [Review]
    public let total: Int
    public let possibleLanguages: [String]
}
