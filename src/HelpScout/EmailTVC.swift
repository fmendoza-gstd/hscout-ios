//
//  MainEmailTVC.swift
//  HelpScout
//
//  Created by Software on 09/12/16.
//  Copyright © 2016 GlobalSTD. All rights reserved.
//

import UIKit

class EmailTVC: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var asuntoLabel: UILabel!
    @IBOutlet weak var msjLabel: UITextView!
    @IBOutlet weak var dateLabel: UILabel!

  
    @IBOutlet weak var etiquetaBtn: UIButton!
    @IBOutlet weak var etiquetaBtn2: UIButton!
    @IBOutlet weak var etiquetaBtn3: UIButton!
    @IBOutlet weak var stack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
         etiquetaBtn.layer.cornerRadius = 5
         etiquetaBtn2.layer.cornerRadius = 5
         etiquetaBtn3.layer.cornerRadius = 5
         etiquetaBtn.adjustsImageWhenDisabled.boolValue
     msjLabel.tintColor = UIColor(red:185/255, green: 193/255, blue: 197/255, alpha:1)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
