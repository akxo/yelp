//
//  Review.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct Review: Decodable {
    public let id: String
    public let rating: Int?
    public let user: User?
    public let text: String?
    public let timeCreated: String?
    public let url: String?
}
