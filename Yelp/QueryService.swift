//
//  QueryService.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

class QueryService {
    
    static let shared = QueryService()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func makeRequest<T>(with url: URL, for type: T.Type, completion: @escaping (T?, Error?) -> ()) where T: Decodable {
        var result: T?
        dataTask?.cancel()
        dataTask = defaultSession.dataTask(with: url) { (data, response, error) in
            defer { self.dataTask = nil }
            if error == nil, let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    result = try JSONDecoder().decode(type, from: data)
                } catch let jsonError {
                    completion(result, jsonError)
                    return
                }
            }
            completion(result, error)
        }
        dataTask?.resume()
    }
}
