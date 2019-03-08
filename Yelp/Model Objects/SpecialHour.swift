//
//  SpecialHour.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct SpecialHour: Decodable {
    public let date: String?
    public let start: String?
    public let end: String?
    public let isOvernight: Bool?
    public let isClosed: Bool?
}
