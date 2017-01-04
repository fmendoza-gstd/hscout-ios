//
//  MenuTableViewCell.swift
//  Copyright © 2016 GlobalSTD. All rights reserved.
//
import UIKit

class MenuTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var numberItems: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
