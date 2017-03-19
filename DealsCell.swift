//
//  DealsCell.swift
//  BofaNew
//
//  Created by Ramesh Khanna on 3/3/15.
//  Copyright (c) 2015 Ramesh Khanna. All rights reserved.
//

import UIKit

class DealsCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    var deal: NSDictionary?{
        didSet{
        configureCell()
        }
    }
    
    private func configureCell(){
        bgImageView.image = UIImage(named: deal?["image"] as! NSString as NSString as String)
        titleLbl.text = deal?["title"] as! NSString as String
        captionLbl.text = deal?["duration"] as! NSString as String
        durationLbl.text = deal?["day"] as! NSString as String
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
