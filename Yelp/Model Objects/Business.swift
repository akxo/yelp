//
//  Business.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

open class Business: Decodable {
    public let id: String
    public let name: String
    public let alias: String?
    public let imageUrl: String?
    public let isClosed: Bool?
    public let url: String?
    public let review_count: Int?
    public let categories: [Category]?
    public let rating: Double?
    public let coordinates: Coordinates?
    public let transactions: [String]?
    public let price: String?
    public let location: Location?
    public let phone: String?
    public let displayPhone: String?
    public let distance: Double?
    public let isClaimed: Bool?
    public let photos: [String]?
    public let hours: [Hours]?
    public let specialHours: [SpecialHour]?
    public let messaging: Messaging?
}
