//
//  PostRequests.swift
//  Reddit
//
//  Created by Nikolay on 16.02.2021.
//

import Foundation

final class PostRequests {
    private var networkClient = NetworkClient()
    
    func getPosts(limit: Int,
                  completion: (([RedditPost]) -> Void)?,
                  failure: ((Error?) -> Void)?) {
        networkClient.request(path: RequestPath.posts.rawValue,
                              method: .get,
                              urlParams: "?limit=\(limit)") { data in
            do {
                let reddit = try JSONDecoder().decode(RedditPostsResponse.self, from: data)
                completion?(reddit.data.children.map( { $0.data } ))
            } catch let error {
                failure?(error)
            }
        } failure: { error in
            print(error as Any)
            failure?(error)
        }
    }
}
