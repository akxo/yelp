//
//  Hours.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct Hours: Decodable {
    let open: [Day]
    let hoursType: String
    let isOpenNow: Bool
}
