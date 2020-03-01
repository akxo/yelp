//
//  NetworkService.swift
//  Yelp
//
//  Created by Alexander Kerendian on 3/2/19.
//  Copyright © 2019 Alexander Kerendian. All rights reserved.
//

struct NetworkService {
    
    static func request<R, T>(_ route: R, parsedInto type: T.Type, completion: @escaping (Result<T, Error>) -> ()) where R: Router, T: Decodable {
        request(route) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try jsonDecoder.decode(type, from: data)
                    completion(.success(result))
                    
                } catch let jsonError {
                    completion(.failure(jsonError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private static func request<R>(_ route: R, completion: @escaping (Result<Data, APIError>) -> ()) where R: Router {
        guard let request = route.urlRequest else {
            completion(.failure(.noUrlRequest))
            return
        }
        
        let urlSession = URLSession(configuration: .default)
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            switch handleHTTP(response) {
            case .success:
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
    private static func handleHTTP(_ response: HTTPURLResponse) -> HTTPResponse {
        switch response.statusCode {
        case 200...299:
            return .success
        case 400:
            return .failure(.badRequest)
        case 401:
            return .failure(.unauthorized)
        case 404:
            return .failure(.notFound)
        case 500...504:
            return .failure(.serverError)
        default:
            return .failure(.unknown)
        }
    }
    
    private enum HTTPResponse {
        case success
        case failure(APIError)
    }
}

public enum APIError: Error {
    case noUrlRequest
    case invalidResponse
    case noData
    case unknown
    
    case badRequest // 400
    case unauthorized // 401
    case notFound // 404
    case serverError // 500 - 504
}
