//
//  Post.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/22/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation

struct Post {
    let id: Int
    let name: String
    let tagline: String
    let votesCount: Int
    let commentsCount: Int
    let previewImageURL: URL
}

struct PostList: Decodable {
    var posts: [Post]
}

extension Post: Decodable {
    
    // Make sure the coding keys match the keys in the json response
    enum PostKeys: String, CodingKey {
        case id
        case name
        case tagline
        case votesCount = "votes_count"
        case commentsCount = "comments_count"
        case previewImageURL = "screenshot_url"
    }
    enum PreviewImageURLKeys: String, CodingKey {
        case imageURL = "850px"
    }
    
    init(from decoder: Decoder) throws {
        let postContainer = try decoder.container(keyedBy: PostKeys.self)
        
        id = try postContainer.decode(Int.self, forKey: .id)
        name = try postContainer.decode(String.self, forKey: .name)
        tagline = try postContainer.decode(String.self, forKey: .tagline)
        votesCount = try postContainer.decode(Int.self, forKey: .votesCount)
        commentsCount = try postContainer.decode(Int.self, forKey: .commentsCount)
        
        let screenShotContainer = try postContainer.nestedContainer(keyedBy: PreviewImageURLKeys.self, forKey: .previewImageURL)
        previewImageURL = try screenShotContainer.decode(URL.self, forKey: .imageURL)
    }
}
