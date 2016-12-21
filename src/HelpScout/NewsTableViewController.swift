//
//  NewsTableViewController.swift
//  SlideMenu
//
//  Created by Simon Ng on 7/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit
import MessageUI

class NewsTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, MenuTransitionManagerDelegate,MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var headerContainer: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let menuTransitionManager = MenuTransitionManager()
    
    @IBOutlet weak var viewFooter: UIView!
    //buttons in nav
    let editImage   = UIImage(named: "trash")!
    let searchImage = UIImage(named: "person")!
    let flag = UIImage(named:"flag2")!
    let searchImage1 = UIImage(named: "tag")!
    
    
    let color = UIColor.whiteColor()
    let color1 = UIColor.redColor()
    let color2 = UIColor.yellowColor()
    let color3 = UIColor.greenColor()
    
    @IBAction func replyButton(sender: AnyObject) {
        
        print("Feedback row tapped.")
        
        let mailComposeViewController = configuredMailComposeViewController()
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
   
        
        //tableView.estimatedRowHeight = 44
       // tableView.rowHeight = UITableViewAutomaticDimension
        

        //declare buttons parameters  whi calls function
        let editButton   = UIBarButtonItem(image: editImage,  style: .Plain, target: self, action: #selector(NewsTableViewController.didTapEditButton(_:)))
        
        let searchButton = UIBarButtonItem(image: searchImage,  style: .Plain, target: self, action: #selector(NewsTableViewController.didTapSearchButton(_:)))
        
        let editButton1  = UIBarButtonItem(image: flag,  style: .Plain, target: self, action: #selector(NewsTableViewController.didTapFlagButton(_:)))
        
        let searchButton1 = UIBarButtonItem(image: searchImage1,  style: .Plain, target: self, action: #selector(NewsTableViewController.didTapSearchButton2(_:)))
        
        navigationItem.rightBarButtonItems = [editButton, searchButton,editButton1,searchButton1]

        self.title = ""
        
    }
    func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
    }
            /*
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
     
        //footer
 
    }
 */
    //button 1
    func didTapEditButton(sender: AnyObject){
        
        print("1")
        
        let meetVC:UIViewController
        meetVC = storyboard!.instantiateViewControllerWithIdentifier("1")
        presentViewController(meetVC, animated: true, completion: nil)
    }
    //Button 2
    func didTapSearchButton(sender: AnyObject){
        print("2")

        
        let meetVC:UIViewController
        meetVC = storyboard!.instantiateViewControllerWithIdentifier("2")
        presentViewController(meetVC, animated: true, completion: nil)
        
    }//Button 3
    func didTapFlagButton(sender: AnyObject){
        
        print("3")

    }
    //Button 4
    func didTapSearchButton2(sender: AnyObject){
        print("4")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    // MARK: - Table view data source

func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 5
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell
        
cell.emailMsj.setContentOffset(CGPointZero, animated: false)
        
        // Configure the cell...
        if indexPath.row == 0 {
          // cell.postImageView.image = UIImage(named: "red-lights-lisbon")
            
            cell.emailMsj.text = "Hello\nis simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu"
            cell.datePost.text = "Jul 19 "
            cell.timePost.text = "10:25am"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-300")
            cell.viewBar.backgroundColor = color
            
        } else if indexPath.row == 1 {
          //  cell.postImageView.image = UIImage(named: "val-throrens-france")
           // cell.postTitle.text = "Val Thorens, France"
            cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 19sbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon"
            cell.datePost.text = "Jul 19 "
            cell.timePost.text = "10:25am"
            cell.postAuthor.text = "BARA ART (bara-art.com)"
            cell.authorImageView.image = UIImage(named: "appcoda-300")
            
            cell.viewBar.backgroundColor = color1
            
        } else if indexPath.row == 2 {
          //  cell.postImageView.image = UIImage(named: "summer-beach-huts")
           // cell.postTitle.text = "Summer Beach Huts, England"
            cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, ed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Liry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 19s, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon"
            cell.datePost.text = "Jul 19 "
            
            cell.timePost.text = "10:25am"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-300")
            cell.viewBar.backgroundColor = color2
        }
         else if indexPath.row == 3 {
         //cell.postImageView.image = UIImage(named: "summer-beach-huts")
         //cell.postTitle.text = "Summer Beach Huts, England"
        cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon,Red Lry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 19 Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed "
         cell.datePost.text = "Jul 19 "
         cell.timePost.text = "10:25am"
         cell.postAuthor.text = "TOM EVERSLEY   (@tomeversley)"
         cell.authorImageView.image = UIImage(named: "appcoda-300")
         cell.viewBar.backgroundColor = color3
    
        }else {
            
             // cell.postImageView.image = UIImage(named: "taxis-nyc")
             // cell.postTitle.text = "Taxis, NYC"
            cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lightsry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 19, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights,"
            
            cell.datePost.text = "Jul 19 "
            cell.timePost.text = "10:25am"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-300")
            cell.viewBar.backgroundColor = UIColor.whiteColor()
            
        }

        return cell
    }
    
    // MARK: - Navigation
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! MenuTableViewController
        self.title = sourceController.currentItem
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "header"{
        
        let menuTableViewController = segue.destinationViewController as! MenuTableViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
            
        }
        
    }
 
    /*

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
 */
    
    /////////UIMESSAGE FEEDBACK
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["software@globalstd.com"])
        mailComposerVC.setSubject("Helps Scout")
        mailComposerVC.setMessageBody("", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
            
        case MFMailComposeResultCancelled.rawValue:
            print("Cancelled mail")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        default:
            break
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    


}
