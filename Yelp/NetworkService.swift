//
//  NetworkService.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func makeRequest<T>(with url: URL, for type: T.Type, completion: @escaping (RequestResult<T>) -> ()) where T: Decodable {
        dataTask?.cancel()
        dataTask = defaultSession.dataTask(with: url) { (data, response, error) in
            defer { self.dataTask = nil }
            if let error = error {
                completion(.error(error))
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(.success(result))
                } catch let jsonError {
                    completion(.error(jsonError))
                    return
                }
            } else {
                completion(.error(nil))
            }
        }
        dataTask?.resume()
    }
}
