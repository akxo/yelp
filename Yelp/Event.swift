//
//  Event.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

class Event: Decodable {
    let id: String
    let name: String
    let description: String
    let attendingCount: Int
    let category: String
    let cost: Double
    let costMax: Double
    let eventSiteUrl: String
    let imageUrl: String
    let interestedCount: Int
    let isCanceled: Bool
    let isFree: Bool
    let isOfficial: Bool
    let latitude: Double
    let longitude: Double
    let ticketsUrl: String
    let timeStart: String
    let timeEnd: String
    let location: Location
    let businessId: String
}
