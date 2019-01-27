//
//  CommentViewController.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/27/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupCommentTable()
    }
    
    var commentTableView = CommentTableView()
    
    func setupCommentTable(){
        view.addSubview(commentTableView)
        
        NSLayoutConstraint.activate([
            commentTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            commentTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            commentTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            commentTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
        
        
    }

}
