//
//  AutocompleteSearch.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/18/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct AutocompleteSearch: Decodable {
    public let terms: [Term]
    public let businesses: [Business]
    public let categories: [Category]
}
