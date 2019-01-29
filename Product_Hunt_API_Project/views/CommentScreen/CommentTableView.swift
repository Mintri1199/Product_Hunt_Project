//
//  CommentTableView.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/27/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class CommentTableView: UITableView, UITableViewDataSource {
    
    var postID: Int!
    
    var comments: [Comment] = [] {
        didSet{
            reloadData()
        }
    }
    
    var networdManager = NetworkManager()
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame , style: style)
        dataSource = self
        delegate = self 
        translatesAutoresizingMaskIntoConstraints = false 
        register(CommentTableViewCell.self, forCellReuseIdentifier: "commentCell")
        backgroundColor = .cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        let comment = comments[indexPath.row]
        cell.commentTextView.text = comment.body
        return cell
    }
    
}

extension CommentTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension CommentTableView {
    
    func updateComment() {
        networdManager.getComments(postID) { result in
            switch result {
                
            case let .success(comments):
                self.comments = comments
            case let .failure(error):
                print(error)
            }
        }
    }
}
