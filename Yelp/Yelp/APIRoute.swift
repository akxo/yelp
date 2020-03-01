//
//  APIRoute.swift
//  Yelp
//
//  Created by Alex Kerendian on 2/29/20.
//  Copyright © 2020 Alexander Kerendian. All rights reserved.
//

enum APIRoute: String {
    case businessSearch = "/businesses/search"
    case phoneSearch = "/businesses/search/phone"
    case transactionSearch = "/transactions/%@/search"
    case businessDetails = "/businesses/%d"
    case businessMatch = "/businesses/matches"
    case reviews = "/businesses/%d/reviews"
    case autocomplete = "/autocomplete"
    case eventLookup = "/events/%d"
    case eventSearch = "/events"
    case featuredEvent = "/events/featured"
    case allCategories = "/categories"
    case categoryDetails = "/categories/%@"
}
