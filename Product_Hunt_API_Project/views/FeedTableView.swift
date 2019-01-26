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
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! FeedTableViewCell
        let post = mockData[indexPath.row ]
        cell.post = post
        return cell
    }
    
    var mockData: [Post] = {
        var meTube = Post(id: 0, name: "MeTube", tagline: "Stream videos for free!", votesCount: 25, commentsCount: 4)
        var boogle = Post(id: 1, name: "Boogle", tagline: "Search anything!", votesCount: 1000, commentsCount: 50)
        var meTunes = Post(id: 2, name: "meTunes", tagline: "Listen to any song!", votesCount: 25000, commentsCount: 590)
        
        return [meTube, boogle, meTunes]
    }()
}

extension FeedTableView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
