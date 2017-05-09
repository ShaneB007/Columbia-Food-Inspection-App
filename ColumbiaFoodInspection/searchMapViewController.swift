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
    
    
    
    
    let manager = CLLocationManager()
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        mapView.setRegion(region, animated: true)
        
        self.mapView.showsUserLocation = true
        //allows to move around not constantly updating
        self.manager.delegate = nil
        
        print("latitude = ", myLocation.latitude, "longitude = ", myLocation.longitude)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        //var st = "hello"
        var items = Model.sharedInstance.fetchCategories()

        var address: String
        
        for item in items{
            
            address = (item.establishment?.address)!
            
            let geocoder = CLGeocoder()
            
            ann(address: address, geocoder: geocoder)
            
            //let address = item.establishment?.address
            
            
            //print("Address = ", address)
        
        //let address  = "2601 S PROVIDENCE COLUMBIA 65203"
        
        //if let article = establishment[indexPath.address].articlesArray?[indexPath.row] {
        

            
        }
        
    }
    
    
    
    func ann(address: String, geocoder: CLGeocoder) -> Void{
    
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
    
            if(distance <= 3218)
            {
                print("Location1 latitude = ", currLocation.latitude,"Location1 longitude = ", currLocation.longitude, "distance = ", distance)
    
                print("latitude = ", coordinates.latitude, "longitude = ", coordinates.longitude)
    
                let annotation = MKPointAnnotation()
                //annotation.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                annotation.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                annotation.title = address
                print("TITLE: ", annotation.title!)
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
