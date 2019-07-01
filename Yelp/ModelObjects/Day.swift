//
//  Day.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct Day: Decodable {
    public let day: Int?
    public let start: String?
    public let end: String?
    public let isOvernight: Bool?
}
