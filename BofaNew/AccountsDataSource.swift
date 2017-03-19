//
//  Reminders.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 2/24/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class AccountsDataSource: NSObject,UITableViewDataSource,UITableViewDelegate{
    
    var accountsArray:NSArray
    
    init(accountsArray:NSArray){
        
        self.accountsArray = accountsArray
        
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountsArray.count
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("accountCell")! as UITableViewCell
        let dict = accountsArray.objectAtIndex(indexPath.row) as! NSDictionary
        print(cell.contentView.subviews)
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: dict["image"] as! String)
        
        let lbl = cell.contentView.viewWithTag(2) as! UILabel
        lbl.text = dict["title"] as! String
        
        let timeLbl = cell.contentView.viewWithTag(3) as! UILabel
        timeLbl.text = dict["time"] as! String
        
        return cell
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
   
}
