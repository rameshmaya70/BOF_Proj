//
//  StockCell.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 3/3/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {

    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var differenceLbl: UILabel!
    
    var stock:NSDictionary? {
        didSet{
            configueCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configueCell(){
    brandLbl.text = stock?["title"] as! NSString as String
    amountLbl.text = stock?["stock"] as! NSString as String
    let sensexStr = stock?["sensex"] as! NSString
    let value:Int = sensexStr.integerValue
    differenceLbl.text = sensexStr as String
    if value>0{
    differenceLbl.backgroundColor = UIColor(red: 0.537, green: 0.705, blue: 0.2, alpha: 1.0)
    }
    }
}
