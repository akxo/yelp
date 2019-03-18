//
//  RequestResult.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/5/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public enum RequestResult<T> where T: Decodable {
    case success(T)
    case error(Error?)
}
