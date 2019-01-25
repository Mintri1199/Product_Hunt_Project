//
//  NameLabel.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/24/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class NameLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
        text = "Name"
        textAlignment = .center
        font = UIFont(name: "Helvetica", size: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Give padding to the label
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.drawText(in: rect.inset(by: insets))
    }
    
    // Adjust the width and height of the label
    override var intrinsicContentSize: CGSize{
        let size = super.intrinsicContentSize
        
        return CGSize(width: size.width + 20,
                      height: size.height + 20)
        
    }
}
