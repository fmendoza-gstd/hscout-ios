//
//  NoteTableViewController.swift
//  HelpScout
//
//  Created by Software on 05/01/17.
//  Copyright © 2017 GlobalSTD. All rights reserved.
//

import UIKit

class NoteTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate{
    
    let status = ["Active","Pending","Closed"]
    
    @IBOutlet weak var addNoteBtn: UIButton!
    
    @IBOutlet weak var txtUserNote: UITextField!
    //closedBtn
    @IBAction func DismissBtn(sender:AnyObject) {

         //self.dismissViewControllerAnimated(true, completion: nil)
        dispatch_async(dispatch_get_main_queue()){
            self.dismissViewControllerAnimated(true, completion: nil)
            /*
            var presentingViewController: UIViewController! = self.presentingViewController
            
            self.dismissViewControllerAnimated(false) {
                // go back to MainMenuView as the eyes of the user
        presentingViewController.dismissViewControllerAnimated(false, completion: nil)
 
            */
        }
    }
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Customize ad  Button
        self.addNoteBtn.frame = CGRectMake(10, 10, 70, 30)
        addNoteBtn.layer.cornerRadius = 5
        
        //delegate
         txtUserNote.delegate = self
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool // called when 'return' key pressed. return false to ignore.
    {
        txtUserNote.resignFirstResponder()
        return true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView!.dequeueReusableCellWithIdentifier("Cellu") as! NoteTVC
    
       let entre = self.status[indexPath.row]
        cell.statusLbl?.text = status[indexPath.row]
    
        

        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
