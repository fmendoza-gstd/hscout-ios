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
    
   
    @IBOutlet weak var searchBar: UISearchBar!
    
     var imageArray = [UIImage(named: "box"), UIImage(named: "box"), UIImage(named: "box"),UIImage(named: "box")]
    
    var titleArray = ["Desarrollo","Sales","Support","Contact Us"]
    
    var emailArray = ["software@globalstd.com","desarrollo@globalstd.com", "ventas@globalstd.com","info@globalstd.com"]
    
    



    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.separatorStyle = .None

     //   searchBar.layer.borderWidth = 1
        searchBar.layer.borderWidth = 0
        searchBar.layer.shadowOpacity =  0
        searchBar.barStyle.hashValue
        

    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArray.count
    }
    //Configuracion de la celda
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SlideMenuCell

        
          cell.selectionStyle = .Blue
        
          cell.Title!.text = titleArray[indexPath.row]
          cell.emailTxt.text = emailArray[indexPath.row]
          cell.imageView?.image = self.imageArray[indexPath.row]
        

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    
        }
}