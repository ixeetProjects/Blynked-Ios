//
//  ShareMessageTableViewCell.swift
//  Blynked
//
//  Created by rahul karn on 9/18/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import UIKit

class ShareViaAppTableViewCell: UITableViewCell
{

        @IBOutlet var img_icon: UIImageView!
        @IBOutlet var lbl_title: UILabel!
        @IBOutlet var img_checkbox: UIImageView!
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
        func setCell(lbl_titleText:String, img_icon: String, img_checkbox: String)
        {
            self.lbl_title.text = lbl_titleText
            self.img_icon.image = UIImage(named: img_icon)
            self.img_checkbox.image = UIImage(named: img_checkbox)
        }
    
}
