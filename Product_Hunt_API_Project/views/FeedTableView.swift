//
//  FeedTableView.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/22/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class FeedTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        delegate = self
        dataSource = self
        backgroundColor =  .cyan
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}
