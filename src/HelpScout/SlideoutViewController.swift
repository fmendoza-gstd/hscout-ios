//
//  SlideoutViewController.swift
//  SlideoutMenuSwift
//
//  Created by testio2k16 on 9/26/16.
//  Copyright © 2016 testio2k16. All rights reserved.
//

import Foundation
import UIKit

class SlideoutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var viewTitle: UIView!
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var imageProfile: UIImageView!
    
    
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var viewMiniHeader: UIView!
    
     var imageArray = [UIImage(named: "box"), UIImage(named: "box"), UIImage(named: "box"),UIImage(named: "box")]
    
    
    var titleArray = ["Desarrollo","Sales","Support","Contact Us"]
    
    var emailArray = ["software@globalstd.com","desarrollo@globalstd.com", "ventas@globalstd.com","info@globalstd.com"]
    
    




    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.separatorStyle = .None
        //background blue
        tableView.backgroundColor = UIColor(red: 49/255, green: 151/255, blue: 214/255, alpha: 1)
        viewTitle.backgroundColor = UIColor(red: 49/255, green: 151/255, blue: 214/255, alpha: 1)
        viewMiniHeader.backgroundColor = UIColor(red: 49/255, green: 151/255, blue: 214/255, alpha: 1)

   //Search Bar
        searchBar.backgroundColor = UIColor(red: 49/255, green: 151/255, blue: 214/255, alpha: 1)
        searchBar.sizeToFit()
        self.searchBar.layer.borderColor = UIColor.blueColor().CGColor
        //self.searchBar.layer.borderWidth = 0.5
        //self.searchBar.layer.cornerRadius = 5.0
        self.searchBar.clipsToBounds = true
        
        //searchBar.frame = CGRect(x: CGFloat(0), y: CGFloat(15), width: CGFloat(50), height: CGFloat(44))
        
        //image
        imageProfile.layer.cornerRadius = 20
        
        //footer
        footerView.backgroundColor = UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)
        //.screen = CGSize.init(width: 200, height: 15)
        
        
        
    }
    override func viewDidLayoutSubviews() {
        
  
        self.searchBar.layoutIfNeeded()
        self.searchBar.layoutSubviews()
        
        self.view.layoutIfNeeded()
        super.viewDidLayoutSubviews()
       

        //textField.backgroundColor = UIColor.redColor()
    }
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArray.count
    }
    //Configuracion de la celda
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SlideMenuCell

     
          cell.Title!.text = titleArray[indexPath.row]
          cell.emailTxt.text = emailArray[indexPath.row]
          cell.imageView?.image = self.imageArray[indexPath.row]
        //SET SELECTION
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)
        //cell.selectionStyle = .Default
        cell.backgroundColor = UIColor.clearColor()
        cell.selectedBackgroundView = backgroundView

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    
        }
}