//
//  ShareVIaAppViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/18/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//
import UIKit

class ShareVIaAppViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tbleHeaderView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var lblTBLHEADER: UILabel!
    
    var arrayOfApps: [ShareViaApp] = [ShareViaApp]()
    var shareSourceViewController = ShareSourceViewController()
    //var shareViaAppViewController = ShareViaAppViewController()
   // var shareMessageTableviewCell = ShareMessageTableviewCell()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpPersons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpPersons()
    {
        var appList1=ShareViaApp(title:"Clipboard", iconImage:"icn_clipboard.png", checkboxImage:"img_inact_check_box.png")
        var appList2=ShareViaApp(title:"Bluetooth", iconImage:"icn_bluetooth.png", checkboxImage:"img_inact_check_box.png")
        var appList3=ShareViaApp(title:"Email", iconImage:"icn_email.png", checkboxImage:"img_inact_check_box.png")
        var appList4=ShareViaApp(title:"Skype", iconImage:"icn_skype.png", checkboxImage:"img_inact_check_box.png")
        var appList5=ShareViaApp(title:"SMS", iconImage:"icn_sms.png", checkboxImage:"img_inact_check_box.png")
        var appList6=ShareViaApp(title:"Whatsapp", iconImage:"icn_whatsapp.png", checkboxImage:"img_inact_check_box.png")
        
        arrayOfApps.append(appList1)
        arrayOfApps.append(appList2)
        arrayOfApps.append(appList3)
        arrayOfApps.append(appList4)
        arrayOfApps.append(appList5)
        arrayOfApps.append(appList6)
    }
    
    // MARK: - Table view DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayOfApps.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "ShareMessageTableViewCell"
        
        var cell: ShareViaAppTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? ShareViaAppTableViewCell
        
        if cell == nil {
            tableView.registerNib(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? ShareViaAppTableViewCell
        }
        
        
        let person = arrayOfApps[indexPath.row]
        cell.setCell(person.title, img_icon:person.iconImage, img_checkbox:person.checkboxImage)
        
        return cell
    }
    
    
    // MARK: - Table view Delegate
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    
//        if indexPath.row == 0 {
//          //  img_checkbox("img_act_check_box.png")
//        }
//        
//        if indexPath.row == 1 {
//            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        
//        if indexPath.row == 2 {
//            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        
//        if indexPath.row == 3 {
//            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        
//        if indexPath.row == 4 {
//            let vc = ShareSourceViewController(nibName: "ShareSourceViewController", bundle: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        
//        if indexPath.row == 5 {
//            let vc = ShareVIaAppViewController(nibName: "ShareVIaAppViewController", bundle: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 63.0
        //Choose your custom row height
    }
    
    @IBAction func btn_backwards(sender: AnyObject) {
        let vc = FavouritesViewController(nibName: "FavouritesViewController", bundle: nil)
        navigationController?.popViewControllerAnimated(true)
    }
}
