//
//  SettingsViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/4/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var containerview: UIView!
    @IBOutlet var myscrollview: UIScrollView!
    @IBOutlet var myView: UIView!
    @IBOutlet var tableviewoutlet: UITableView!
    
    
// code for switch buttons starts from here...

    @IBOutlet var versusButton: UIImageView!
    
    @IBAction func btnSwitch_1(sender: UIButton) {
                
    }
    
    @IBAction func btnSwitch_2(sender: AnyObject) {
    }
    
    @IBAction func btnSwitch_3(sender: AnyObject) {
    }

    @IBAction func btnSwitch_4(sender: AnyObject) {
    }
    
    @IBAction func btnSwitch_5(sender: AnyObject) {
    }
    
// code for switch buttons ends here...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Set up the container view to hold your custom view hierarchy
        let containerSize = self.myView.frame.size
        println(containerSize)
        containerview = UIView(frame: CGRect(origin: CGPointMake(0.0, 0.0), size:containerSize))
        myscrollview.addSubview(containerview)
        
        // Tell the scroll view the size of the contents
        myscrollview.contentSize = containerSize;
        
        centerScrollViewContents()
    }
    
    func centerScrollViewContents() {
        let boundsSize = myscrollview.bounds.size
        var contentsFrame = containerview.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        containerview.frame = contentsFrame
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return containerview
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView!) {
        centerScrollViewContents()
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
