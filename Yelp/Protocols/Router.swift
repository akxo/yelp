//
//  Router.swift
//  Yelp
//
//  Created by Alex Kerendian on 2/28/20.
//  Copyright © 2020 Alexander Kerendian. All rights reserved.
//

protocol Router {
    
    associatedtype R: Request
    
    var request: R { get }
    var path: APIRoute { get }
    var queryItems: [URLQueryItem]? { get }
    var url: URL? { get }
    var urlRequest: URLRequest? { get }
}

extension Router {
    
    var queryItems: [URLQueryItem]? {
        guard let params = request.params else { return nil }
        
        return params
            .compactMapValues { $0.description }
            .map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "https://api.yelp.com/v3"
        components.path = path.rawValue
        components.queryItems = queryItems
        return components.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        var urlRequest = URLRequest(url: url)
        
        if let apiKey = Yelp.apiKey {
            urlRequest.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        }
        
        return urlRequest
    }
}
