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
        register(FeedTableViewCell.self, forCellReuseIdentifier: "cell")
        translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}

extension FeedTableView: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
