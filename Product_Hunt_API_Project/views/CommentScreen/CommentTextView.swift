//
//  CommentTextField.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/27/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class CommentTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont(name: "Helvetica", size: 15)
        minimumZoomScale = 0.2
        text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc non pretium orci. Nunc semper eros eget erat ullamcorper, non vulputate metus elementum. Pellentesque finibus iaculis mi id porttitor. Cras tristique elementum elit, eu blandit ipsum suscipit non. Nam ac tempor tortor, ut imperdiet nisi. Integer fringilla vulputate quam, sit amet sollicitudin sem ultrices a. Donec tempus id nibh quis commodo."
        isEditable = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
