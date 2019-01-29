//
//  Comment.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/27/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    
    let id: Int
    let body: String
}

struct CommentApiResponse: Decodable {
    let comments: [Comment]
}


