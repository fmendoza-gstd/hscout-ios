//
//  SlideMenuCell.swift
//  HelpScout
//
//  Created by Software on 13/12/16.
//  Copyright © 2016 GlobalSTD. All rights reserved.
//

import UIKit

class SlideMenuCell: UITableViewCell {

  //  @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var emailTxt: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
