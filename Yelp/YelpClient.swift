//
//  YelpClient.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

public class YelpClient {
    
    public static let shared = YelpClient()
    
    private let baseUrlString = "https://api.yelp.com/v3/"
    private var apiKey: String = ""
    private var apiKeyWasSet = false
    
    private init() {}
    
    /// Sets the API key for the shared Yelp client.
    /// Should be called in AppDelegate didFinishLaunching...
    ///
    /// Sign up for Yelp as a developer and find your API key on
    /// the "Manage App" tab of the Yelp Fusion Documentation.
    /// (https://www.yelp.com/developers/v3/manage_app)
    ///
    /// Yelp API requests cannot be made without an API key.
    ///
    /// - Parameters:
    ///   - apiKey: Personal key that identifies the caller.
    public func set(apiKey: String) {
        guard !apiKeyWasSet else { return }
        self.apiKey = apiKey
        apiKeyWasSet = true
    }
    
    // MARK: Business Endpoints
    
    /// Returns an array of bussinesses that meet the search criteria
    /// and wrapped inside the BusinessSearch object
    ///
    /// See the business search endpoint documentation for more information.
    /// (https://www.yelp.com/developers/documentation/v3/business_search)
    ///
    /// If the required parameter is not given the request cannot be made.
    ///
    /// - Parameters:
    ///   - location: Required if either latitude or longitude is not provided.
    ///   - latitude: Required if location is not provided.
    ///   - longitude: Required if location is not provided.
    ///   (remaining parameters are optional. See doc to for info on each one)
    ///
    /// - Returns: An optional BusinessSearch object and error
    public func businessSearch(term: String? = nil,
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
        
        guard apiKeyWasSet else {
            print("error: the api key was never set for the static shared instance of yelp client")
            completion(.error(nil))
            return
        }
        
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
                NetworkService.shared.makeRequest(with: url, and: apiKey, for: BusinessesSearch.self) { completion($0) }
            }
        }
    }
    
    /// Returns an array of businesses based on the provided phone number.
    /// It's possible for more than one business to have the same number
    /// (for example, chain stores with the same +1 800 phone number).
    ///
    /// See the phone search endpoint documentation for more information.
    /// (https://www.yelp.com/developers/documentation/v3/business_search_phone)
    ///
    /// If the required parameter is not given the request cannot be made.
    ///
    /// - Parameters:
    ///   - phone: Required. Phone number of the business you want to search for.
    ///     It must start with + and include the country code, like +14159083801.
    ///
    /// - Returns: An optional PhoneSearch object and error
    public func phoneSearch(phone: String,
                            completion: @escaping (RequestResult<PhoneSearch>) -> ()) {
        
        guard apiKeyWasSet else {
            print("error: the api key was never set for the static shared instance of yelp client")
            completion(.error(nil))
            return
        }
        
        guard phone.hasPrefix("+") else {
            print("error: phone number must start with '+'")
            completion(.error(nil))
            return
        }
        
        let queryItems = [URLQueryItem(name: "phone", value: phone)]
        if var urlComponents = URLComponents(string: baseUrlString + "businesses/search/phone") {
            urlComponents.queryItems = queryItems
            if let url = urlComponents.url {
                NetworkService.shared.makeRequest(with: url, and: apiKey, for: PhoneSearch.self, completion: { completion($0) })
            }
        }
    }
    
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
