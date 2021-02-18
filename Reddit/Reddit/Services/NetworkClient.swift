//
//  NetworkClient.swift
//  Reddit
//
//  Created by Nikolay on 16.02.2021.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

final class NetworkClient {
    
    func request(path: String,
                 method: HTTPMethod = .post,
                 urlParams: String? = nil,
                 completion: @escaping (Data) -> Void,
                 failure: @escaping (Error?) -> Void) {
        var newPath = path
        if let urlParams = urlParams {
            newPath.append(urlParams)
        }
        
        guard let url = URL(string: newPath) else {
            failure(RedditError.tryAgain)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, responce, error) in
            guard let data = data else { return }
            
            if error == nil {
                completion(data)
            } else {
                failure(error)
            }
        }.resume()
    }
}
