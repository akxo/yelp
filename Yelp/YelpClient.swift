//
//  YelpClient.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

class YelpClient {
    
    private let baseUrlString = "https://api.yelp.com/v3/"
    private let apiKey: String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    // MARK: Business Endpoints
    
    /// Returns an array of bussinesses that meet the search criteria
    /// and wrapped inside the BusinessSearch object
    ///
    /// See the business search endpoint documentation for more information.
    /// (https://www.yelp.com/developers/documentation/v3/business_search)
    ///
    /// If the required parameter is not given the result will be nil.
    ///
    /// - Parameters:
    ///   - location: Required if either latitude or longitude is not provided.
    ///   - latitude: Required if location is not provided.
    ///   - longitude: Required if location is not provided.
    ///   (remaining parameters are optional. See doc to for info on each one)
    ///
    /// - Returns: An optional BusinessSearch object and error
    func businessSearch(term: String? = nil,
                        location: String? = nil,
                        latitude: Double? = nil,
                        longitude: Double? = nil,
                        radius: Int? = nil,
                        categories: String? = nil,
                        locale: String? = nil,
                        limit: Int? = nil,
                        offset: Int? = nil,
                        sortBy: String? = nil,
                        price: String? = nil,
                        openNow: Bool? = nil,
                        openAt: Int? = nil,
                        attributes: String? = nil,
                        completion: @escaping (RequestResult<BusinessesSearch>) -> ()) {
        
        guard location != nil || (latitude != nil && longitude != nil) else {
            completion(.error(nil))
            return
        }
        
        var queryItems = [URLQueryItem]()
        if let term = term { queryItems.append(URLQueryItem(name: "term", value: term)) }
        if let location = location { queryItems.append(URLQueryItem(name: "location", value: location)) }
        if let latitude = latitude { queryItems.append(URLQueryItem(name: "latitude", value: "\(latitude)")) }
        if let longitude = longitude { queryItems.append(URLQueryItem(name: "longitude", value: "\(longitude)")) }
        if let radius = radius { queryItems.append(URLQueryItem(name: "radius", value: "\(radius)")) }
        if let categories = categories { queryItems.append(URLQueryItem(name: "categories", value: categories)) }
        if let locale = locale { queryItems.append(URLQueryItem(name: "locale", value: locale)) }
        if let limit = limit { queryItems.append(URLQueryItem(name: "limit", value: "\(limit)")) }
        if let offset = offset { queryItems.append(URLQueryItem(name: "offset", value: "\(offset)")) }
        if let sortBy = sortBy { queryItems.append(URLQueryItem(name: "sort_by", value: sortBy)) }
        if let price = price { queryItems.append(URLQueryItem(name: "price", value: price)) }
        if let openNow = openNow { queryItems.append(URLQueryItem(name: "open_now", value: "\(openNow)")) }
        if let openAt = openAt { queryItems.append(URLQueryItem(name: "open_at", value: "\(openAt)")) }
        if let attributes = attributes { queryItems.append(URLQueryItem(name: "attributes", value: attributes)) }
        
        if var urlComponents = URLComponents(string: baseUrlString + "businesses/search") {
            urlComponents.queryItems = queryItems
            if let url = urlComponents.url {
                NetworkService.shared.makeRequest(with: url, for: BusinessesSearch.self) { completion($0) }
            }
        }
    }
    
    func phoneSearch() {}
    
    func transactionSearch() {}
    
    func businessDetails() {}
    
    func businessMatch() {}
    
    func reviews() {}
    
    func autocomplete() {}
    
    // MARK: Event Endpoints (beta)
    
    func eventSearch() {}
    
    func featuredEvent() {}
    
    // MARK: Category Endpoints (beta)
    
    func allCategories() {}
    
    func categoryDetails() {}
}
