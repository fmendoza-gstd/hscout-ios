//
//  MenuTableViewController.swift
//  Copyright © 2016 GlobalSTD. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    struct Objects{
        
        
        var sectionName : String!
        var sectionObjects: [String]!
        var numberItems:[String]!
        
    }
    
    var objectsArray = [Objects]()
    
    
    @IBOutlet weak var imageIcon: UIImageView!
    
    var menuItems = ["Unassigned", "Mine", "Drafts", "Assigned", "Closed"]
    var imageArray = [UIImage(named: "carta"), UIImage(named: "hand"), UIImage(named: "draft"),UIImage(named: "folder"),UIImage(named: "closed")]

    var menuNumber = ["1", "3", "0", "2", "3"]

    var titleArray2 = ["Folders"]
    var currentItem = "Unassigned"

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        objectsArray = [Objects(sectionName: "Status",sectionObjects: ["Unassigned", "Mine", "Drafts", "Assigned", "Closed"],numberItems: ["2","3","1","7","6"]),Objects(sectionName: "Teams",sectionObjects: ["Software", "Product", "Marketing"],numberItems: ["1","3","7"]),Objects(sectionName: "Folders",sectionObjects: ["VIP Conversation", "Waiting 6 Days", "Drafts", "Assigned", "Closed"],numberItems: ["1","0","6","3","10"])]


        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //Return the number of sections.
        return objectsArray.count
        //return menuItems.count
        //return 1
        
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        //return objectsArray[section].sectionObjects.count
        //return menuItems.count
        return objectsArray[section].sectionObjects.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuTableViewCell
        // Configure the cell...

       // cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.text = objectsArray[indexPath.section].sectionObjects[indexPath.row]
    
        cell.titleLabel.textColor = (objectsArray[indexPath.section].sectionObjects[indexPath.row] == currentItem) ? UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1) : UIColor.grayColor()
        
        /*
        cell.titleLabel.textColor = (objectsArray[])
        cell.numberItems.text = menuNumber[indexPath.row]
        cell.numberItems.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1): UIColor.grayColor()
         */
        
         cell.numberItems.text =  objectsArray[indexPath.section].numberItems[indexPath.row]
        
        cell.numberItems.textColor = (objectsArray[indexPath.section].numberItems[indexPath.row] == currentItem) ? UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1): UIColor.grayColor()
        
        
        cell.imageView?.image = imageArray[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        
        
        let menuTableViewController = segue.sourceViewController as! MenuTableViewController
        if let selectedIndexPath = menuTableViewController.tableView.indexPathForSelectedRow {

            //currentItem = objectsArray[selectedIndexPath.row]
            //currentItem = menuItems[selectedIndexPath.row]
            //currentItem = Objects[section][selectedIndexPath.row]
            //currentItem = objectsArray[selectedIndexPath]
            
              currentItem =  objectsArray[selectedIndexPath.section].numberItems[selectedIndexPath.row]
              currentItem =  objectsArray[selectedIndexPath.section].sectionObjects[selectedIndexPath.row]
            

            
            
            /*
            let meetVC:UIViewController
            meetVC = storyboard!.instantiateViewControllerWithIdentifier("Mine")
            let vcName = menuItems[selectedIndexPath.row]
            let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
            self.navigationController?.pushViewController(viewController!, animated: true
             */

        }
    }
   override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
     // return titleArray.count
      return objectsArray[section].sectionName


        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*
        if indexPath.row == 1{

            let vcName = menuItems[indexPath.row]
            let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
            self.navigationController?.pushViewController(viewController!, animated: true)
             let meetVC:UIViewController
            meetVC = storyboard!.instantiateViewControllerWithIdentifier("9")
            showViewController(meetVC, sender: UIViewController.self)
         }
       }
    }

    }
    override func tableView(tableView: (UITableView!), titleForHeaderInSection section: Int) -> (String!){
 
        if (section == 0){
            return

        if (section == 1){
                
            return
 
        }
    }
}
 
  */

}
}

