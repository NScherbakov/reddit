//
//  RedditPostsResponse.swift
//  Reddit
//
//  Created by Nikolay on 16.02.2021.
//

import Foundation

struct RedditPostsResponse: Decodable {
    let data: RedditData
}

struct RedditData: Decodable {
    let children: [RedditChlidren]
}

struct RedditChlidren: Decodable {
    let data: RedditPost
}
