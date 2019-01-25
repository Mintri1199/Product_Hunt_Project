//
//  CVLabel.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/24/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// This is going to be the comments and votes label
class CVLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "Helvetica", size: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
