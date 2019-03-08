//
//  Hours.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct Hours: Decodable {
    public let open: [Day]?
    public let hoursType: String?
    public let isOpenNow: Bool?
}
