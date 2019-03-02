//
//  User.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/1/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let profileUrl: String
    let imageUrl: String
}
