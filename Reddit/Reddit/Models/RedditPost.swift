//
//  RedditPost.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import Foundation

struct RedditPost: Decodable {
    let title: String
    let thumbnailURL: String
    let author: String
    let commentsCount: Int
    let createdUTC: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnailURL = "thumbnail"
        case author = "author_fullname"
        case commentsCount = "num_comments"
        case createdUTC = "created_utc"
    }
}
