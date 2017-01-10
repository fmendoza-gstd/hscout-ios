//
//  NoteTableViewController.swift
//  HelpScout
//
//  Created by Software on 05/01/17.
//  Copyright © 2017 GlobalSTD. All rights reserved.
//

import UIKit

class AssignTableViewController: UITableViewController{
    
    var names = [String]()
    
    //closedBtn
    /*
    @IBAction func DismissBtn(sender:AnyObject) {

         //self.dismissViewControllerAnimated(true, completion: nil)
        dispatch_async(dispatch_get_main_queue()){
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
 */

    var imgs = [UIImage(named: "shi"), UIImage(named: "shi"), UIImage(named: "shi")]
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        
     names = ["Jorge Alexis Romero Meza","Eduardo Vazquez","Israel Valdivia"]
        
        
        //Customize add Button
    }
override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
 override    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
override
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }
    
override  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    
    
    let cell = self.tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AssignTVC
    
    cell.nameLbl.text = names[indexPath.row]
    cell.imgProfile.image = imgs[indexPath.row]
    
    
        return cell
    }


  }
