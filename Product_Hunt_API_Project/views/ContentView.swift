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
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var nameLabel = NameLabel(frame: .zero)
    var cvStackView = VotesCommentsStackView(frame: .zero)
    var taglineLabel: CVLabel = {
        var label =  CVLabel(frame: .zero)
        label.text = "Tagline"
        return label
    }()
    
    func setupLabels() {
        addSubview(nameLabel)
        addSubview(cvStackView)
        addSubview(taglineLabel)
    
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            cvStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cvStackView.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: cvStackView.leadingAnchor, constant: -12),
            
            taglineLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            taglineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            taglineLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
    
}
