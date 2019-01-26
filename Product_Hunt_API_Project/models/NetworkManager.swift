//
//  NetworkManager.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/26/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import Foundation

class NetworkManager {
    let urlSession = URLSession.shared
    var baseURL = "https://api.producthunt.com/v1/"
    var token = ""


    func getPosts(completion: @escaping ([Post]) -> ()) {
        let query = "posts/all?sort_by=votes_count&order=desc&search[featured]=true&per_page=20"
        let fullURL = URL(string: baseURL + query)!
        var request = URLRequest(url: fullURL)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Accept": "application/json",
            "Content-Type" : "application/json",
            "Authorization" : "Bearer \(token)", // Oh my god, authorization didn't work because I forgot a separation space between Bearer and token
            "Host" : "api.producthunt.com"
        ]
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Check for error
            if let error = error { print(error.localizedDescription); return }
            
            // Check to see if there is any data that was retrieved.
            guard let data = data else { return }
            print(data)
            
            // Attempt to decode the data
            guard let result = try? JSONDecoder().decode(PostList.self, from: data) else { return }
            let post = result.posts
            
            // Return the result with the completion handler asynchronously.
            DispatchQueue.main.async {
                completion(post)
            }
        }
        
        // task is paused by default so we have to resume it
        task.resume()
    }
}


