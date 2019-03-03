//
//  Business.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

class Business: Decodable {
    let id: String
    let name: String
    let alias: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let review_count: Int
    let categories: [Category]
    let rating: Double
    let coordinates: Coordinates
    let transactions: [String]
    let price: String
    let location: Location
    let phone: String
    let displayPhone: String
    let distance: Double
    let isClaimed: Bool
    let photos: [String]
    let hours: [Hours]
    let specialHours: [SpecialHour]
    let messaging: Messaging
}
