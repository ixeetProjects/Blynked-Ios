//
//  ShareViewController.swift
//  Blynked
//
//  Created by rahul karn on 9/5/15.
//  Copyright (c) 2015 sameer. All rights reserved.
//

import UIKit
import GoogleMaps
import MobileCoreServices

class HomeViewController: UIViewController, UITableViewDelegate, GMSMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    @IBOutlet var shareView: UIView!
    var imagePicker: UIImagePickerController!
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    var mapTasks = MapTasks()
    var locationMarker: GMSMarker!
    var originMarker: GMSMarker!
    var destinationMarker: GMSMarker!
    var routePolyline: GMSPolyline!
    var markersArray: Array<GMSMarker> = []
    var waypointsArray: Array<String> = []
    
    var mapView: GMSMapView!
    
    //   var txtframe: CGRect!
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if !didFindMyLocation {
            let myLocation: CLLocation = change[NSKeyValueChangeNewKey] as CLLocation
            mapView.camera = GMSCameraPosition.cameraWithTarget(myLocation.coordinate, zoom: 10.0)
            mapView.settings.myLocationButton = true
            
            didFindMyLocation = true
        }
    }
    
    @IBAction func btn_MapType(sender: AnyObject) {
       
        let actionSheet = UIAlertController(title: "Map Types", message: "Select map type:", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let normalMapTypeAction = UIAlertAction(title: "Normal", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            var camera = GMSCameraPosition.cameraWithLatitude(28.6202199, longitude: 77.3581031, zoom: 12)
            var mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-20), camera: camera)
            mapView.myLocationEnabled = true
            mapView.mapType = kGMSTypeNormal
            // self.view.insertSubview(mapView, atIndex:1)

        }
        
        let terrainMapTypeAction = UIAlertAction(title: "Terrain", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
            var camera = GMSCameraPosition.cameraWithLatitude(28.6202199, longitude: 77.3581031, zoom: 12)
            var mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-20), camera: camera)
            mapView.myLocationEnabled = true
           
            mapView.mapType = kGMSTypeTerrain
             self.view.insertSubview(mapView, atIndex:2)
            
           // self.view = mapView
        }
        
        let hybridMapTypeAction = UIAlertAction(title: "Hybrid", style: UIAlertActionStyle.Default) { (alertAction) -> Void in
           
            var camera = GMSCameraPosition.cameraWithLatitude(28.6202199, longitude: 77.3581031, zoom: 12)
            var mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-20), camera: camera)
            mapView.myLocationEnabled = true
            
            mapView.mapType = kGMSTypeHybrid
            self.view.insertSubview(mapView, atIndex:3)
            //self.view = mapView
        }
        
        let cancelAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel) { (alertAction) -> Void in
            
        }
        
        actionSheet.addAction(normalMapTypeAction)
        actionSheet.addAction(terrainMapTypeAction)
        actionSheet.addAction(hybridMapTypeAction)
        actionSheet.addAction(cancelAction)
        
        presentViewController(actionSheet, animated: true, completion: nil)
    }
    
   
    @IBAction func btn_myLocation(sender: AnyObject) {
    }
    
    
    @IBAction func btn_ZoomOut(sender: AnyObject) {
    }
    
    
    @IBAction func btn_ZoomIn(sender: AnyObject) {

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var camera = GMSCameraPosition.cameraWithLatitude(28.6202199, longitude: 77.3581031, zoom: 12)
        var mapView = GMSMapView.mapWithFrame(CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-20), camera: camera)
        mapView.myLocationEnabled = true
        self.view.insertSubview(mapView, atIndex:0)
        
        // self.view = mapView
        
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(28.6202199, 77.3581031)
        marker.title = "Noida sector 62"
        marker.snippet = "India"
        marker.icon = UIImage(named: "img_dp_pin@2x.png")
        marker.map = mapView
        
        var noida = GMSCameraPosition.cameraWithLatitude(28.6202199, longitude: 77.3581031, zoom: 8)
        mapView.camera = noida
        
        mapView.animateToBearing(0)
        mapView.animateToViewingAngle(145)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openCamera(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera;
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
}
