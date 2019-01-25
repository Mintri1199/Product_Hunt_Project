//
//  ContentView.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/24/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class ContentView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var nameLabel = NameLabel(frame: .zero)
    
    func setupLabel() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            ])
    }
    
}
