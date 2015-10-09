//
//  HomeViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/11/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//
import UIKit

class ShareViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableViewHome: UITableView!
    var arrayOfFavourites: [CreateFavourite] = [CreateFavourite]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var favouriteCustomCell: FavouriteCustomCell = FavouriteCustomCell()
        self.setUpPersons()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpPersons()
    {
        var favourite1=CreateFavourite(title:"Source", description:"Define your source", iconImage:"icn_source@2x.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
        var favourite2=CreateFavourite(title:"Destination", description:"Define your destination", iconImage:"icn_destination@2x.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
        var favourite3=CreateFavourite(title:"Recipients", description:"Select recipients", iconImage:"icn_recipients.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
        var favourite4=CreateFavourite(title:"Duration", description:"Set your sharing time", iconImage:"icn_duration.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
        var favourite5=CreateFavourite(title:"Message", description:"Send a message", iconImage:"icn_message.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
        var favourite6=CreateFavourite(title:"Share via App", description:"Select an app", iconImage:"icn_share_via_app.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
        
        arrayOfFavourites.append(favourite1)
        arrayOfFavourites.append(favourite2)
        arrayOfFavourites.append(favourite3)
        arrayOfFavourites.append(favourite4)
        arrayOfFavourites.append(favourite5)
        arrayOfFavourites.append(favourite6)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfFavourites.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "FavouriteCustomCell"
        var cell: FavouriteCustomCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? FavouriteCustomCell
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? FavouriteCustomCell
        }
        
        let person = arrayOfFavourites[indexPath.row]
        cell.setCell(person.title, lbl_descriptionText:person.description, img_icon:person.iconImage, img_arrow:person.arrowImage, img_seperator:person.seperatorImage)
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        if indexPath.row == 0 {
            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 1 {
            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 2 {
            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 3 {
            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 4 {
            let vc = ShareMessageViewController(nibName: "ShareMessageViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 5 {
            let vc = ShareVIaAppViewController(nibName: "ShareVIaAppViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 63.0
    }
}