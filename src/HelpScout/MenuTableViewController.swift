//
//  MenuTableViewController.swift
//  SlideMenu
//
//  Created by Simon Ng on 9/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

 
    @IBOutlet weak var imageIcon: UIImageView!
    
    var menuItems = ["Unassigned", "Mine", "Drafts", "Assigned", "Closed"]
    var imageArray = [UIImage(named: "2"), UIImage(named: "2"), UIImage(named: "2"),UIImage(named: "2"),UIImage(named: "4")]

    var menuNumber = ["1", "3", "0", "2", "3"]
    var currentItem = "Unassigned"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
        
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return menuItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuTableViewCell
        // Configure the cell...
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1) : UIColor.grayColor()
    
        cell.numberItems.text = menuNumber[indexPath.row]
        cell.numberItems.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1): UIColor.grayColor()
        
        cell.imageView?.image = imageArray[indexPath.row]

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {
            
            
            currentItem = menuItems[selectedIndexPath.row]
        }
    }
    
}
