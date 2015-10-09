//
//  ShareSourceViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/17/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import UIKit
import GoogleMaps
import MobileCoreServices

class ShareSourceViewController: UIViewController, UITableViewDelegate, GMSMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet var myTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTitle.text = "Destination"
        // Do any additional setup after loading the view.
        var camera = GMSCameraPosition.cameraWithLatitude(28.6202199, longitude: 77.3581031, zoom: 12)
        var mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-90), camera: camera)
        mapView.myLocationEnabled = true
        self.view.insertSubview(mapView, atIndex:0)
        
        //self.view = mapView
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(28.6202199, 77.3581031)
        marker.title = "Noida sector 62"
        marker.snippet = "India"
        marker.icon = UIImage(named: "img_dp_pin@2x.png")
        marker.map = mapView
        
        var noida = GMSCameraPosition.cameraWithLatitude(28.6202199,
            longitude: 77.3581031, zoom: 8)
        mapView.camera = noida
        
        
        mapView.animateToBearing(0)
        mapView.animateToViewingAngle(145)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btn_BackShare(sender: AnyObject) {
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController?.popViewControllerAnimated(true)
        
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
