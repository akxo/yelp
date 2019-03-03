//
//  Location.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct Location: Decodable {
    let address1: String
    let address2: String
    let address3: String
    let city: String
    let zipCode: String
    let country: String
    let state: String
    let displayAddress: [String]
    let crossStreets: String
}
