//
//  Request.swift
//  Yelp
//
//  Created by Alex Kerendian on 2/29/20.
//  Copyright © 2020 Alexander Kerendian. All rights reserved.
//

protocol Request {
    var params: [String: CustomStringConvertible]? { get }
}
