//
//  BusinessesSearch.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct BusinessesSearch: Decodable {
    public let total: Int
    public let region: [String : Coordinates]
    public let businesses: [Business]
}
