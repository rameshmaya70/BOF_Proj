//
//  OffersDataSource.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 2/24/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class DealsDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var dealsArray:NSArray
    
    init(dealsArray:NSArray){
        
        self.dealsArray = dealsArray
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dealsArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("dealsCell")! as UITableViewCell
        let dict = dealsArray.objectAtIndex(indexPath.row) as! NSDictionary
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: dict["image"] as! NSString as String)
        
        let lbl = cell.contentView.viewWithTag(2) as! UILabel
        lbl.text = dict["title"] as! NSString as String
        
        let durationLbl = cell.contentView.viewWithTag(3) as! UILabel
        durationLbl.text = dict["duration"] as! NSString as String
        
        let dayLbl = cell.contentView.viewWithTag(4) as! UILabel
        dayLbl.text = dict["day"] as! NSString as String
        
        return cell
    }
    
     func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
}
