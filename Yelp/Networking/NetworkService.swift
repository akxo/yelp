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
    
    private init() {}
    
    func makeRequest<T>(with url: URL, and apiKey: String, for type: T.Type, completion: @escaping (Result<T, Error>) -> ()) where T: Decodable {
        dataTask?.cancel()
        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        dataTask = defaultSession.dataTask(with: request) { (data, response, error) in
            defer { self.dataTask = nil }
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try jsonDecoder.decode(type, from: data)
                    completion(.success(result))
                } catch let jsonError {
                    completion(.failure(jsonError))
                    return
                }
            } else {
                completion(.failure(YelpError.unspecific))
            }
        }
        dataTask?.resume()
    }
}
