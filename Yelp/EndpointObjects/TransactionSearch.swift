//
//  TransactionSearch.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/15/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct TransactionSearch: Decodable {
    public let total: Int
    public let businesses: [Business]
}
