//
//  PhoneSearch.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/12/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct Businesses: Decodable {
    public let total: Int
    public let businesses: [Business]
}
