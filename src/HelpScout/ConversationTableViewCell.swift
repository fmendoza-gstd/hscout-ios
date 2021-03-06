//
//  NewsTableViewCell.swift
//  SlideMenu
//
//  Created by Simon Ng on 7/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class ConversationTableViewCell: UITableViewCell {
    //@IBOutlet weak var postImageView:UIImageView!
    //@IBOutlet weak var postTitle:UILabel!
    @IBOutlet weak var postAuthor:UILabel!
    @IBOutlet weak var authorImageView:UIImageView!
    @IBOutlet weak var viewBar: UIView!

    @IBOutlet weak var emailMsj: UILabel!
    @IBOutlet weak var datePost: UILabel!
    @IBOutlet weak var timePost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
        authorImageView.layer.masksToBounds = true
        
   
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
