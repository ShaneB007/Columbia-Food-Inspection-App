//
//  searchMapViewController.swift
//  ColumbiaFoodInspection
//
//  Created by Matthew Pokoik on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class searchMapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var controller: UISegmentedControl!
    
    let manager = CLLocationManager()
    
    var radiusSize = 3218.69

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        mapView.setRegion(region, animated: true)
        
        self.mapView.showsUserLocation = true
        //allows to move around not constantly updating
        self.manager.delegate = nil
        
        //print("latitude = ", myLocation.latitude, "longitude = ", myLocation.longitude)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //var st = "hello"
        
        
        var address: String
        var name: String
        let items = Model.sharedInstance.fetchCategories()
        for item in items{
            
            address = (item.establishment?.address)!
            name = (item.establishment?.name)!
            
            let geocoder = CLGeocoder()
            
            ann(address: address, geocoder: geocoder, name: name)
            
            
        }
        
    }
    
    
    @IBAction func radius(_ sender: Any) {
     if controller.selectedSegmentIndex == 0
     {
        radiusSize = 1609.34
        var address: String
        var name: String
        let items = Model.sharedInstance.fetchCategories()
        for item in items{
            
            address = (item.establishment?.address)!
            name = (item.establishment?.name)!
            
            let geocoder = CLGeocoder()
            
            ann(address: address, geocoder: geocoder, name: name)
            
            
        }
     }
     if controller.selectedSegmentIndex == 1
     {
        radiusSize = 3218.69
        var address: String
        var name: String
        let items = Model.sharedInstance.fetchCategories()
        for item in items{
            
            address = (item.establishment?.address)!
            name = (item.establishment?.name)!
            
            let geocoder = CLGeocoder()
            
            ann(address: address, geocoder: geocoder, name: name)
            
            
        }
     }
     if controller.selectedSegmentIndex == 2
     {
        radiusSize = 8046.72
        
        var address: String
        var name: String
        let items = Model.sharedInstance.fetchCategories()
        for item in items{
            
            address = (item.establishment?.address)!
            name = (item.establishment?.name)!
            
            let geocoder = CLGeocoder()
            
            ann(address: address, geocoder: geocoder, name: name)
            
            
        }
     }
     if controller.selectedSegmentIndex == 3
     {
        radiusSize = 96560.6
        var address: String
        var name: String
        let items = Model.sharedInstance.fetchCategories()
        for item in items{
            
            address = (item.establishment?.address)!
            name = (item.establishment?.name)!
            
            let geocoder = CLGeocoder()
            
            ann(address: address, geocoder: geocoder, name: name)
            
            
        }
     }
    /*let items = Model.sharedInstance.fetchCategories()
    var address: String
    var name: String
    let geocoder = CLGeocoder()
    ann(address: address, geocoder: geocoder, name: name)*/
    
    
    
    
    
    
    
    
    
    
    
}



func ann(address: String, geocoder: CLGeocoder, name: String) -> Void{
    
    //print("CALLED")
    
    
    
    
    geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
        if let error = error {
            print(error)
        }
        //print("AAAAAAAHHHH ")
        
        if let placemark = placemarks?.first {
            let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
            
            let currLocation = self.manager.location?.coordinate ?? CLLocationCoordinate2D()
            let loc = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            let loc1 = CLLocation(latitude: currLocation.latitude, longitude: currLocation.longitude)
            let distance = loc1.distance(from: loc)
            
            if(distance <= self.radiusSize)
            {
                print("ACCEPTED: ", name)
                //print("Location1 latitude = ", currLocation.latitude,"Location1 longitude = ", currLocation.longitude, "distance = ", distance)
                
                //print("latitude = ", coordinates.latitude, "longitude = ", coordinates.longitude)
                let annotation = MKPointAnnotation()
                //annotation.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                annotation.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                annotation.title = name
                annotation.subtitle = address
                //print("TITLE: ", annotation.title!)
                self.mapView.addAnnotation(annotation)
                
            }
        }
    })
    
}












override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

}

