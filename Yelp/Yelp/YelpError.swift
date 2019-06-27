//
//  YelpError.swift
//  Yelp
//
//  Created by Alex Kerendian on 6/26/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public enum YelpError: Error {
    case unspecific
    case apiKeyNotSet
    case locationRequired
    case phoneNumberInvalid
    case stateCodeInvalid
    case countryCodeInvalid
}
