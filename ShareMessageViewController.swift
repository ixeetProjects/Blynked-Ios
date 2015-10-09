//
//  ShareMessageViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/18/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import UIKit

class ShareMessageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet var shareHeader: UIView!
    
    @IBOutlet var shareMessageView: UIView!

    @IBOutlet var tableView: UITableView!
    
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
    
        return shareHeader
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 93.0
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        checked[indexPath.row] = !checked[indexPath.row]
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = numbers[indexPath.row]
//        if checked[indexPath.row] {
//            cell.accessoryType = .Checkmark
//        } else {
//            cell.accessoryType = .None
//        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    @IBAction func btn_backShareMessage(sender: AnyObject) {
        
        let vc = ShareViewController(nibName: "ShareViewController", bundle: nil)
        navigationController?.popViewControllerAnimated(true)
    }
}
