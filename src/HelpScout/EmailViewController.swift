//
//  ViewController.swift
//  HelpScout
//
//  Created by Software GlobalSTD on 09/12/16.
//  Copyright © 2016 GlobalSTD. All rights reserved.
//

import UIKit
import PZPullToRefresh




class EmailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,PZPullToRefreshDelegate{
    

   let menuTransitionManager = MenuTransitionManager()
    

    //  @IBOutlet weak var selectedCellLabel: UILabel!
    var menuView: BTNavigationDropdownMenu!
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var OpenBtn: UIBarButtonItem!
    var refreshHeaderView: PZPullToRefreshView?
    
    
    
    var EmailList:[Emails] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   self.title = "Unassigned"
        
        //tint nav
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
   
        //refreshControll
        if refreshHeaderView == nil {
            let view = PZPullToRefreshView(frame: CGRectMake(0, 0 - tableView.bounds.size.height, tableView.bounds.size.width, tableView.bounds.size.height))
            view.delegate = self
            tableView.addSubview(view)
            refreshHeaderView = view
        }

        //Local Data
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Eduardo Vazquez", date: "3:58 pm",asunto:"Reenviar correo a  ventas",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "Ventas"))
        
        EmailList.append(Emails(name:"German Tovar", date: "10:58 am",asunto:"Confirmación",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "Fact"))
        
        EmailList.append(Emails(name:"Gabriel Vazquez", date: "3:58 pm",asunto:"Re:Fix Bug",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Francisco Mendoza", date: "7:36 am",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Israel Valdivia", date: "3:58 pm",asunto:"Re:Dar de Baja Usuario",descriptionMsj: "El motivo del presente es porque ya no labora aqui..",tags: "DO"))
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
        EmailList.append(Emails(name:"Jorge Romero", date: "3:58 pm",asunto:"Retardos",descriptionMsj: "El motivo del presente es porque ha llegado un min...",tags: "DO"))
        
         
        
        
        
        //Bar button item action
        OpenBtn.target = self.revealViewController()
        OpenBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)]

        
        self.navigationController?.navigationBar.translucent = true
        
        /*
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 94/25, blue: 137/255, alpha: 1)
       self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)]
        
        //Items of Menu
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "Unassigned", items: items)
        
        
        menuView.cellHeight = 40
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.blueColor()
       // menuView.cellTextLabelColor = UIColor.grayColor()
        menuView.selectedCellTextLabelColor = UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)
        menuView.shouldKeepSelectedTextColor = true
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 14)
        menuView.cellTextLabelAlignment = .Left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.3
        menuView.maskBackgroundColor = UIColor.blackColor()
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            if indexPath == 0{
                
      self.menuView.selectedCellTextLabelColor = UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)
                
        }else{
         
         
            }
      switch(indexPath){
      
            case 1: print("1")
            self.selectedCellLabel.textColor = UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)
         
         
            break
                
            default: break
            }

            self.selectedCellLabel.text = items[indexPath]
    }
  
       self.navigationItem.titleView = menuView
              self.selectedCellLabel.textColor = UIColor(red: 31/255, green: 94/255, blue: 137/255, alpha: 1)
*/
        
}//End ViewDidload
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    //     self.menuView.cellTextLabelColor = UIColor.blueColor()
    }

    
    //numbers of section in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EmailList.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = self.tableView!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! EmailTVC
        

        
        let email = self.EmailList[indexPath.row]
        
         cell.nameLabel.text = email.name
         cell.asuntoLabel.text = email.asunto
         cell.msjLabel.text = email.descriptionMsj
         cell.dateLabel.text = email.date
        
        
        //cell.textLabel?.text = items[indexPath.row]
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
    
    
    //PopUp
 /*
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        
        return .None
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showpop"{
            let  vc = segue.destinationViewController
            let  controller = vc.popoverPresentationController
            controller?.delegate = self
      }
    }
 */
 
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
        let sourceController = segue.sourceViewController as! MenuTableViewController
        
        self.title = sourceController.currentItem
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
        let menuTableViewController = segue.destinationViewController as! MenuTableViewController
        menuTableViewController.currentItem = self.title!
        menuTableViewController.transitioningDelegate = menuTransitionManager
        //menuTransitionManager.delegate = self
        


      
    }
    
    

}

