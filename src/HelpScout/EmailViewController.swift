//
//  ViewController.swift
//  HelpScout
//
//  Created by Software GlobalSTD on 09/12/16.
//  Copyright © 2016 GlobalSTD. All rights reserved.
//

import UIKit
import PZPullToRefresh

class EmailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PZPullToRefreshDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshHeaderView: PZPullToRefreshView?
    
    var EmailList:[Emails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tint nav
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        //refreshControll
        if refreshHeaderView == nil {
            let view = PZPullToRefreshView(frame: CGRectMake(0, 0 - tableView.bounds.size.height, tableView.bounds.size.width, tableView.bounds.size.height))
            view.delegate = self
            tableView.addSubview(view)
            refreshHeaderView = view
        }
        
        
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Eduardo Vazquez", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "Ventas"))
        
        EmailList.append(Emails(name:"German Tovar", date: "10:58 am",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "Fact"))
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Francisco Mendoza", date: "7:36 am",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Israel Valdivia", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))

        
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EmailList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = self.tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! EmailTVC
        
        //cell.textLabel?.text = items[indexPath.row]
        
        let email = self.EmailList[indexPath.row]
        
         cell.nameLabel.text = email.name
         cell.asuntoLabel.text = email.asunto
         cell.msjLabel.text = email.descriptionMsj
         cell.dateLabel.text = email.date
        // cell.etiquetaBtn.text = email.tags
        
        
        
        return cell
        
    }
    
    // MARK:UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        refreshHeaderView?.refreshScrollViewDidScroll(scrollView)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        refreshHeaderView?.refreshScrollViewDidEndDragging(scrollView)
    }
    
    // MARK:PZPullToRefreshDelegate
    func pullToRefreshDidTrigger(view: PZPullToRefreshView) -> () {
        refreshHeaderView?.isLoading = true
        
        let delay = 1.0 * Double(NSEC_PER_SEC)
        let time  = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), {
            print("Complete loading!")
            self.refreshHeaderView?.isLoading = false
            self.refreshHeaderView?.refreshScrollViewDataSourceDidFinishedLoading(self.tableView)
        })
    }
    func pullToRefreshLastUpdated(view: PZPullToRefreshView) -> NSDate {
        return NSDate()
    }
    
}

