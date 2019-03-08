//
//  Location.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct Location: Decodable {
    public let address1: String?
    public let address2: String?
    public let address3: String?
    public let city: String?
    public let zipCode: String?
    public let country: String?
    public let state: String?
    public let displayAddress: [String]?
    public let crossStreets: String?
}
