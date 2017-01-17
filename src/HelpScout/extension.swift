//
//  extension.swift
//  HelpScout
//
//  Created by Software on 11/01/17.
//  Copyright © 2017 GlobalSTD. All rights reserved.
//

import Foundation
import UIKit


extension UITextView{
    private func add(placeholder: UILabel) {
        
        for view in self.subviews {
            if let lbl = view as? UILabel  {
                if lbl.text == placeholder.text {
                   lbl.removeFromSuperview()
                }
            }
        }
        self.addSubview(placeholder)
    }
    
    func addPlaceholder(placeholder: UILabel?) {
        if let ph = placeholder {
            ph.numberOfLines = 0  // support for multiple lines
           // ph.font = UIFont.italicSystemFont(ofSize: (self.font?.pointSize)!)
            ph.sizeToFit()
           add(ph)
            ph.frame.origin = CGPoint(x: 5, y: (self.font?.pointSize)! / 2)
            ph.textColor = UIColor(white: 0, alpha: 0.3)
            updateVisibility(ph)
        }
    }
    
    func updateVisibility(placeHolder: UILabel?) {
        if let ph = placeHolder {
            ph.hidden = !self.text.isEmpty
        }
    }
}