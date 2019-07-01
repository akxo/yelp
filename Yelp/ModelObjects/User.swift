//
//  User.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public struct User: Decodable {
    public let id: String
    public let name: String?
    public let profileUrl: String?
    public let imageUrl: String?
}
