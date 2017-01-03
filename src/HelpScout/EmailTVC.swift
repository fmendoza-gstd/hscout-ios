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
    
    let color = UIColor(red: 111/255, green: 186/255, blue: 78/255, alpha: 1)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //Btn 1
        self.etiquetaBtn.layer.cornerRadius = 5
        self.etiquetaBtn.layer.borderColor = UIColor.purpleColor().CGColor
        self.etiquetaBtn.titleLabel?.textColor = UIColor.purpleColor()
        self.etiquetaBtn.layer.borderWidth = 0.8
        
        //Btn2
         etiquetaBtn2.layer.cornerRadius = 5
      //  self.layer.borderColor = UIColor(red: 111/255, green: 186/255, blue: 78/255, alpha: 1)
        
        self.etiquetaBtn2.titleLabel?.textColor = UIColor.init(red: 111/255, green: 186/255, blue: 78/255, alpha: 1)
        self.etiquetaBtn2.layer.borderWidth = 0.8
        self.etiquetaBtn2.layer.borderColor = UIColor.init(red: 111/255, green: 186/255, blue: 78/255, alpha: 1).CGColor
        //Btn3
         etiquetaBtn3.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.orangeColor().CGColor
        self.etiquetaBtn3.titleLabel?.textColor = UIColor.orangeColor()
        self.etiquetaBtn3.layer.borderWidth = 0.8
        self.etiquetaBtn3.layer.borderColor = UIColor.orangeColor().CGColor
     

        
        //Msj Label & Deshabilitar
         msjLabel.tintColor = UIColor(red:185/255, green: 193/255, blue: 197/255, alpha:1)
         msjLabel.userInteractionEnabled = false
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
