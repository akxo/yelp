//
//  Business.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct Business: Decodable {
    let id: String
    let alias: String
    let name: String
    let image_url: String
    let is_closed: Bool
    let url: String
    let review_count: Int
    let categories: [Category]
    let rating: Double
//    let coordinates: Coordinates
//    let transactions: [Transaction]
    let price: String
    let location: Location
    let phone: String
    let display_phone: String
    let distance: Double
    
    let is_claimed: Bool
    let photos: [String]
//    let hours: Hours
//    let messaging: Messaging
    
}
