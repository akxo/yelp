//
//  Event.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct Event: Decodable {
    public let id: String
    public let name: String?
    public let description: String?
    public let attendingCount: Int?
    public let category: String?
    public let cost: Double?
    public let costMax: Double?
    public let eventSiteUrl: String?
    public let imageUrl: String?
    public let interestedCount: Int?
    public let isCanceled: Bool?
    public let isFree: Bool?
    public let isOfficial: Bool?
    public let latitude: Double?
    public let longitude: Double?
    public let ticketsUrl: String?
    public let timeStart: String?
    public let timeEnd: String?
    public let location: Location?
    public let businessId: String?
}
