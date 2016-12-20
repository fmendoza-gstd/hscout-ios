//
//  HeaderViewController.swift
//  HelpScout
//
//  Created by Software on 20/12/16.
//  Copyright © 2016 GlobalSTD. All rights reserved.
//

import UIKit

class HeaderViewController: UIViewController {

    @IBOutlet weak var tag: UIButton!
    @IBOutlet weak var tag2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tag1
         tag.layer.cornerRadius = 5
        self.tag.layer.borderColor = UIColor.purpleColor().CGColor
        self.tag.layer.borderWidth = 0.8
        
        
        //tag2
        tag2.layer.cornerRadius = 5
        self.tag2.layer.borderColor = UIColor.orangeColor().CGColor
        self.tag2.layer.borderWidth = 0.8
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
