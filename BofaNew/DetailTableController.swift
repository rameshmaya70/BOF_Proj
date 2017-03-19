//
//  DetailTableController.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 3/2/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class DetailTableController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dealsArray:NSArray!
    var accountsArray:NSArray!
    var stocksArray:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("WidgetData", ofType:"plist")
        let widgetDict = NSDictionary(contentsOfFile:path!)
        dealsArray = widgetDict!["Deals"] as! NSArray
        accountsArray = widgetDict!["Accounts"] as! NSArray
        stocksArray = widgetDict!["Stock"] as! NSArray
        
        tableView.registerNib(UINib(nibName: "DealsCell", bundle: nil), forCellReuseIdentifier: "DealsCell")
        tableView.registerNib(UINib(nibName: "AccountCell", bundle: nil), forCellReuseIdentifier: "AccountCell")
        tableView.registerNib(UINib(nibName: "StockCell", bundle: nil), forCellReuseIdentifier: "StockCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailTableController:UITableViewDataSource,UITableViewDelegate{
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int = 0
        
        switch(section){
        case 0:
            count = dealsArray.count
        case 1:
            count = accountsArray.count
        case 2:
            count = stocksArray.count
        default:
            count = 0
            
        }
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var retCell:UITableViewCell!
        
        switch indexPath.section{
        case 0:
        
            let cell = tableView.dequeueReusableCellWithIdentifier("DealsCell", forIndexPath: indexPath) as! DealsCell
            let dict = dealsArray.objectAtIndex(indexPath.row) as! NSDictionary
            cell.deal = dict
            retCell = cell
        
        case 1:
            let dict = accountsArray.objectAtIndex(indexPath.row) as! NSDictionary
            let cell = tableView.dequeueReusableCellWithIdentifier("AccountCell", forIndexPath: indexPath) as! AccountCell
            cell.account = dict
            retCell = cell
        case 2:
            let dict = stocksArray.objectAtIndex(indexPath.row) as! NSDictionary
            let cell = tableView.dequeueReusableCellWithIdentifier("StockCell", forIndexPath: indexPath) as! StockCell
           cell.stock = dict
            retCell = cell
        default:
            print("")
        }
//
        
        return retCell
    }
    
    
     func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
     func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let array = NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil) as NSArray
        let headerView = array.lastObject as! HeaderView
        
        switch(section){
        case 0:
            headerView.headerLbl.text = "Deals of the day"
            headerView.imageView.image = UIImage(named:"deals")
        case 1:
            
            headerView.headerLbl.text = "Accounts"
            headerView.imageView.image = UIImage(named:"balance-small")
        case 2:
            headerView.headerLbl.text = "Stocks"
            headerView.imageView.image = UIImage(named:"stocks-small")
        default:
            
            headerView.headerLbl.text = ""
        }
        return headerView
        
    }

     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height:CGFloat = 0.0
        
        switch(indexPath.section){
        case 0:
            height = 80.0
        case 1:
            height = 45.0
        case 2:
            height = 53.0
        default:
            height = 0.0
            
        }
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return height
    }
}