//
//  DetailController.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 2/27/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var dealsTable: UITableView!
    @IBOutlet weak var stocksTable: UITableView!
    @IBOutlet weak var accountsTable: UITableView!
    
    var dealsDataSource:DealsDataSource?
    var accountsDataSource:AccountsDataSource?
    var stocksDataSource:StockDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("WidgetData", ofType:"plist")
        
        let widgetDict = NSDictionary(contentsOfFile:path!)
        let dealsArray = widgetDict!["Deals"] as! NSArray
        let accountsArray = widgetDict!["Accounts"] as! NSArray
        let stocksArray = widgetDict!["Stock"] as! NSArray
        
        dealsDataSource = DealsDataSource(dealsArray: dealsArray)
        dealsTable.dataSource = dealsDataSource
        dealsTable.delegate = dealsDataSource
        
        accountsDataSource = AccountsDataSource(accountsArray: accountsArray)
        accountsTable.dataSource = accountsDataSource
        accountsTable.delegate = accountsDataSource
        
        stocksDataSource = StockDataSource(stocksArray: stocksArray)
        stocksTable.dataSource = stocksDataSource
        stocksTable.delegate = stocksDataSource

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
