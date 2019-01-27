//
//  CommentCellTableViewCell.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/27/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .green
        setupTextView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    var commentTextView = CommentTextView(frame: .zero)
    
    func setupTextView() {
        addSubview(commentTextView)
        
        NSLayoutConstraint.activate([
            commentTextView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            commentTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            commentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            commentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            ])
    }
    
    
}
