//
//  EventSearch.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/19/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct EventSearch: Decodable {
    public let total: Int
    public let events: [Event]
}
