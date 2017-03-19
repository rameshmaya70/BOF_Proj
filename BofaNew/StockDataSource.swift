//
//  StockSensex.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 2/24/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class StockDataSource: NSObject,UITableViewDelegate,UITableViewDataSource{
    
    var stocksArray:NSArray
    
    init(stocksArray:NSArray){
        
        self.stocksArray = stocksArray
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("StockCell")! as UITableViewCell
        let dict = stocksArray.objectAtIndex(indexPath.row) as! NSDictionary
       
        
        let tileLbl = cell.contentView.viewWithTag(1) as! UILabel
        tileLbl.text = dict["title"] as! NSString as String
        
        let stockLbl = cell.contentView.viewWithTag(3) as! UILabel
        stockLbl.text = dict["stock"] as! NSString as String
        
        let sensexLbl = cell.contentView.viewWithTag(2) as! UILabel
        let sensexStr = dict["sensex"] as! NSString
        let value:Int = sensexStr.integerValue
        sensexLbl.text = sensexStr as String
        if value>0{
           sensexLbl.backgroundColor = UIColor(red: 0.537, green: 0.705, blue: 0.2, alpha: 1.0)
        }
        
        
        return cell
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
}
