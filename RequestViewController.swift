//
//  RequestViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/3/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet var tableViewCreateFavourites: UITableView!
    var arrayOfFavourites: [CreateFavourite] = [CreateFavourite]()
    var shareSourceViewController = ShareSourceViewController()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpPersons()
        var favouriteCustomCell = FavouriteCustomCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpPersons()
    {
     
        var favourite1=CreateFavourite(title:"Recipients", description:"Select recipients", iconImage:"icn_recipients.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
       
        var favourite2=CreateFavourite(title:"Share via App", description:"Select an app", iconImage:"icn_share_via_app.png", arrowImage:"img_right_arrow@2x.png", seperatorImage:"img_hor_div_act@2x.png")
        
        arrayOfFavourites.append(favourite1)
        arrayOfFavourites.append(favourite2)
    
    }
    
    // MARK: - Table view DataSource
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
    
    
    // MARK: - Table view Delegate
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        if indexPath.row == 0 {
            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 1 {
            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 63.0
        //Choose your custom row height
    }
    
    @IBAction func btn_backFavourite(sender: AnyObject) {
        let vc = FavouritesViewController(nibName: "FavouritesViewController", bundle: nil)
        navigationController?.popViewControllerAnimated(true)
    }
    

}
