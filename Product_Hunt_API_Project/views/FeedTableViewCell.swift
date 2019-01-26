//
//  FeedTableViewCell.swift
//  Product_Hunt_API_Project
//
//  Created by Jackson Ho on 1/23/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet{
            guard let post = post else { print("Invalid post"); return }
            customContentView.nameLabel.text =  post.name
            customContentView.taglineLabel.text = post.tagline
            customContentView.cvStackView.commentLabel.text =  "Comments: \(post.commentsCount)"
            customContentView.cvStackView.voteLabel.text =  "Votes: \(post.votesCount)"
            updatePreviewImage()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCustomContent()
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
    
    var customContentView = ContentView()
    
    func setupCustomContent(){
        self.contentView.addSubview(customContentView)
        customContentView.backgroundColor = .red
        NSLayoutConstraint.activate([
            customContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            customContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ])
        
    }
    
    func updatePreviewImage() {
        guard let post = post else {print("Invalid post"); return}
        
        customContentView.imageView.image =  UIImage(named: "placeholder")
    }
    
    
}
