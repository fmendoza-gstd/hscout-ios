//
//  NewsTableViewController.swift
//  SlideMenu
//
//  Created by Simon Ng on 7/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit

class NewsTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, MenuTransitionManagerDelegate {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewFooter = UIView(frame: CGRectMake(0, 0, 600, 50))

        
        
        let customView = UIView(frame: CGRectMake(0, 0, 100, 100))
        customView.backgroundColor = UIColor.redColor()
        let button = UIButton(frame: CGRectMake(0, 0, 100, 100))
        
        button.setTitle("Submit", forState: .Normal)
        button.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        customView.addSubview(button)
        
//        tableView.tableFooterView = customView

        
        //declare buttons parameters
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

        // Configure the cell...
        if indexPath.row == 0 {
          // cell.postImageView.image = UIImage(named: "red-lights-lisbon")
            cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon"
            cell.datePost.text = "Jul 19 "
            cell.timePost.text = "10:25am"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-300")
            cell.viewBar.backgroundColor = color
            
        } else if indexPath.row == 1 {
          //  cell.postImageView.image = UIImage(named: "val-throrens-france")
           // cell.postTitle.text = "Val Thorens, France"
            cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon"
            cell.datePost.text = "Jul 19 "
            cell.timePost.text = "10:25am"
            cell.postAuthor.text = "BARA ART (bara-art.com)"
            cell.authorImageView.image = UIImage(named: "appcoda-300")
            
            cell.viewBar.backgroundColor = color1
            
        } else if indexPath.row == 2 {
          //  cell.postImageView.image = UIImage(named: "summer-beach-huts")
           // cell.postTitle.text = "Summer Beach Huts, England"
            cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon"
            cell.datePost.text = "Jul 19 "
            
            cell.timePost.text = "10:25am"
            cell.postAuthor.text = "TOM EVERSLEY (@tomeversley)"
            cell.authorImageView.image = UIImage(named: "appcoda-300")
            cell.viewBar.backgroundColor = color2
        }
         else if indexPath.row == 3 {
         //cell.postImageView.image = UIImage(named: "summer-beach-huts")
         //cell.postTitle.text = "Summer Beach Huts, England"
        cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon"
         cell.datePost.text = "Jul 19 "
         cell.timePost.text = "10:25am"
         cell.postAuthor.text = "TOM EVERSLEY   (@tomeversley)"
         cell.authorImageView.image = UIImage(named: "appcoda-300")
         cell.viewBar.backgroundColor = color3
    
        }else {
            
             // cell.postImageView.image = UIImage(named: "taxis-nyc")
             // cell.postTitle.text = "Taxis, NYC"
            cell.emailMsj.text = "Red Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon,Red Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, LisbonRed Lights, Lisbon"
            
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


}
