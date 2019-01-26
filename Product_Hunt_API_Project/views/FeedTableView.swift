//
//  FeedTableView.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/22/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class FeedTableView: UITableView, UITableViewDataSource {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        backgroundColor =  .cyan
        register(FeedTableViewCell.self, forCellReuseIdentifier: "postCell")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! FeedTableViewCell
        let post = posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
    // If mockData var is set, call reloadData()
    var posts: [Post] = [] {
        didSet{
            reloadData()
        }
    }
    
    var networkManager = NetworkManager()
    
    func updateFeed() {
        networkManager.getPosts() { result in
            self.posts = result
        }
    }
}

extension FeedTableView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
