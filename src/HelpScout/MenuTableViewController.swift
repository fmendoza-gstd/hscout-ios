//
//  MenuTableViewController.swift
//  SlideMenu
//
//  Created by Simon Ng on 9/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    struct Objects{
        var sectionName : String!
        var sectionObjects: [String]!
        
    }
    
    var objectsArray = [Objects]()
    
    
    @IBOutlet weak var imageIcon: UIImageView!
    
    var menuItems = ["Unassigned", "Mine", "Drafts", "Assigned", "Closed"]
    var imageArray = [UIImage(named: "2"), UIImage(named: "2"), UIImage(named: "2"),UIImage(named: "2"),UIImage(named: "4")]

    var menuNumber = ["1", "3", "0", "2", "3"]
    
    var titleArray = ["Team","Folders"]
    
    var currentItem = "Unassigned"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //objectsArray = [Objects(sectionName: "Team",sectionObjects: ["Unassigned", "Mine", "Drafts", "Assigned", "Closed"]),Objects(sectionName: "Team",sectionObjects: ["Unassigned", "Mine", "Drafts", "Assigned", "Closed"]),Objects(sectionName: "Team",sectionObjects: ["Unassigned", "Mine", "Drafts", "Assigned", "Closed"])]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
        
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        //return objectsArray.count
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        //return objectsArray[section].sectionObjects.count
         return menuItems.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuTableViewCell
        // Configure the cell...
        
        
        cell.titleLabel.text = menuItems[indexPath.row]
        //cell.titleLabel.text = objectsArray[indexPath.section].sectionObjects[indexPath.row]
        
        
        
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1) : UIColor.grayColor()
    
        cell.numberItems.text = menuNumber[indexPath.row]
        cell.numberItems.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1): UIColor.grayColor()
        
        cell.imageView?.image = imageArray[indexPath.row]

        return cell
    }


     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> Int? {
        
   // return objectsArray[section].sectionName.count
        return titleArray.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {

            currentItem = menuItems[selectedIndexPath.row]
        }
    }
    
}
