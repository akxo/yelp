//
//  Category.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct Category: Decodable {
    public let alias: String?
    public let title: String?
    public let parentAliases: [String]?
    public let countryWhitelist: [String]?
    public let countryBlacklist: [String]?
}
