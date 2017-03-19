//
//  AccountCell.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 3/3/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {

    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var durationLbl: UILabel!
    
    var account:NSDictionary? {
        didSet {
            configureCell()
            
            }
    }
    
    private func configureCell(){
        
        iconImageView.image = UIImage(named: account?["image"] as! NSString as NSString as String)
        amountLbl.text = account?["title"] as! NSString as String
        durationLbl.text = account?["time"] as! NSString as String
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
