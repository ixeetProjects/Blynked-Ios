//
//  FavouritesViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/4/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tbleHeaderView: UIView!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var tbleFooterView: UIView!
    @IBOutlet var lblTBLHEADER: UILabel!
    
    let CellIdentifier = "TableCellView"
    
    var numbers = ["One","Two","Three","Four","Five"]
    
    var checked: [Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // object of table view header
        
        checked = [Bool](count: numbers.count, repeatedValue: false)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier)
    }
    
    
    @IBAction func btnTblFooter(sender: AnyObject) {
        
        let vc = CreatefavouriteViewController(nibName: "CreatefavouriteViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
//        var objHeader = TableHeaderView()
//        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
//        headerView.backgroundColor = UIColor.whiteColor()
//        
//        headerView.addSubview(objHeader.myHeaderView);
        return tbleHeaderView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
//        footerView.backgroundColor = UIColor.lightGrayColor()
//        var title = UILabel()
//        title.font = UIFont(name: "Futura", size: 16)!
//        title.textColor = UIColor(red: 255.0/255.0, green: 133.0/255.0, blue: 43.0/255.0, alpha: 1.0)
//        title.text = "  Create a new favourite event"
//        //        let header = view as UITableViewHeaderFooterView
//       // footerView.addSubview(title)
//        
//        return title
        return tbleFooterView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        checked[indexPath.row] = !checked[indexPath.row]
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = numbers[indexPath.row]
        if checked[indexPath.row] {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
    }

}
