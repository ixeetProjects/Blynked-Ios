//  FavouriteCustomCellTableViewCell.swift
//  Blynked
//
//  Created by rahul karn on 9/11/15.
//  Copyright (c) 2015 sameer. All rights reserved.

import UIKit

class FavouriteCustomCell: UITableViewCell
{
    @IBOutlet var img_icon: UIImageView!
    @IBOutlet var lbl_title: UILabel!
    @IBOutlet var lbl_description: UILabel!
    @IBOutlet var img_arrow: UIImageView!
    @IBOutlet var img_seperator: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func setCell(lbl_titleText:String, lbl_descriptionText:String, img_icon: String, img_arrow: String, img_seperator: String)
    {
        self.lbl_title.text = lbl_titleText
        self.lbl_description.text = lbl_descriptionText
        self.img_icon.image = UIImage(named: img_icon)
        self.img_arrow.image = UIImage(named: img_arrow)
        self.img_seperator.image = UIImage(named: img_seperator)
    }
}

