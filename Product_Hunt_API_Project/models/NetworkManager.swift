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
    var token = "ea37060aab65f22810a385fc08254f151b00ac19595799088f0c862efcdc62d8"
    
    func makeRequest(for endpoint: EndPoints) -> URLRequest{
        let stringParams = endpoint.paramsToString()
        let path = endpoint.getPath()
        let fullURL = URL(string: baseURL.appending("\(path)?\(stringParams)"))!
        var request = URLRequest(url: fullURL)
        request.httpMethod = endpoint.getHTTPMethod()
        request.allHTTPHeaderFields = endpoint.getHeaders(token: token)
        
        return request
        
    }
    
    // What does this syntax mean?
    enum Result<T>{
        case success(T)
        case failure(Error)
    }
    
    enum EndPointError: Error {
        case  couldNotParse
        case  noData
    }
    
    func getPosts(_ completion: @escaping (Result<[Post]>) -> Void)  {
        let postResquest = makeRequest(for: .posts)
        let task = urlSession.dataTask(with: postResquest) { data, response, error in
            
            // Check for error
            if let error = error {
                return completion(Result.failure(error))
            }
            
            // Check to see if there any data was retrieved
            guard let data = data else { return completion(Result.failure(EndPointError.noData))}
            
            // Attempt to decode the data
            guard let result = try? JSONDecoder().decode(PostList.self, from: data) else { return completion(Result.failure(EndPointError.couldNotParse)) }
            
            let posts = result.posts
            
            DispatchQueue.main.async {
                completion(Result.success(posts))
            }
        }
        task.resume()
    }
    
    enum EndPoints {
        case posts
        case comments(postId: Int)
        
        func getPath() -> String{
            switch self {
            case .posts:
                return "posts/all"
            case .comments:
                return "comments"
            }
        }
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        func getHeaders(token: String) -> [String : String] {
            return [
                "Accept": "application/json",
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",
                "Host": "api.producthunt.com",
            ]
        }
        
        func getParams() -> [String:String] {
            switch self  {
            case .posts:
                return [
                    "sort_by": "votes_count",
                    "order": "desc",
                    "per_page": "20",
                    "search[featured]": "true"
                ]

            case .comments(let postId):
                return [
                    "sort_by": "votes",
                    "order": "asc",
                    "per_page": "20",
                    "search[post_id]": "\(postId)"
                ]
            }
        }
        
        func paramsToString() -> String {
            let parameterArray = getParams().map {key, value in
                return "\(key)=\(value)"
            }
            return parameterArray.joined(separator: "&")
        }
    }
    
    func getComments (_ postId: Int, completion: @escaping (Result<[Comment]>) -> Void) {
        let commentRequest = makeRequest(for: .comments(postId: postId))
        let task = urlSession.dataTask(with: commentRequest) {data, response, error in
            
            // Check if there is error
            if let error = error{
                return completion(Result.failure(error))
            }
            
            // Check if there any data was retrieved
            guard let data = data else { return completion(Result.failure(EndPointError.noData)) }
            
            // Attempt to decode the data
            guard let result = try? JSONDecoder().decode(CommentApiResponse.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }
            
            DispatchQueue.main.async {
                completion(Result.success(result.comments))
            }
        }
        task.resume()
    }
}
