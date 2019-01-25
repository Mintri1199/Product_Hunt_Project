//
//  VotesCommentsStackView.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/24/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class VotesCommentsStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        distribution = .fillEqually
        
        addArrangedSubview(commentLabel)
        addArrangedSubview(voteLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var commentLabel: CVLabel = {
        var label = CVLabel(frame: .zero)
        label.text = "Comments: 0"
        return label
    }()
    
    var voteLabel: CVLabel = {
        var label = CVLabel(frame: .zero)
        label.text = "Comments: 0"
        return label
    }()
    
    
    
}
