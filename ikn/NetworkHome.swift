//
//  NetworkHome.swift
//  ikn
//
//  Created by Naufal on 23/11/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

class NetworkingManager {
    typealias CompletionHandler = (Result<Data, Error>) -> Void
    
    func fetchData(path: String, method: HTTPMethod, queryParams: [String: String]? = nil, headers: [String: String]? = nil, completion: @escaping CompletionHandler) {
        var components = URLComponents(string: "https://smartcityapp.ikn.go.id")
        //  https://103.59.95.19
//    https://smartcityapp.ikn.go.id
        // Ensure path starts with a "/"
        if !path.hasPrefix("/") {
            components?.path += "/"
        }
        components?.path += path
        
        components?.queryItems = queryParams?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let fullURL = components?.url else {
            completion(.failure(NSError(domain: "Invalid URL FULL URL LINE 31", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue
        
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            completion(.success(data))
            
        }.resume()
    }
}
