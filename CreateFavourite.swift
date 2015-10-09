//
//  CreateFavourite.swift
//  Blynked
//
//  Created by rahul karn on 9/11/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import Foundation

class CreateFavourite
{
    var title = "title"
    var description = "description"
    var iconImage = "iconImage"
    var arrowImage = "arrowImage"
    var seperatorImage = "seperatorImage"
    
    init(title: String, description: String, iconImage: String, arrowImage: String, seperatorImage: String)
    {
        self.title = title
        self.description = description
        self.iconImage = iconImage
        self.arrowImage = arrowImage
        self.seperatorImage = seperatorImage
    }
}