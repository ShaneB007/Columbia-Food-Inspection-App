//
//  EstablishmentDetailViewController.swift
//  ColumbiaFoodInspection
//
//  Created by Shane Bishop on 5/5/17.
//  Copyright © 2017 Columbia Food Inspection Group. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class EstablishmentDetailViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var violationColor: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var numberViolations: UILabel!
    @IBOutlet weak var violationInfo: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var item: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
            restaurantName.text = item?.establishment?.name
            restaurantAddress.text = item?.establishment?.address
            restaurantAddress.sizeToFit()
        if let crit = item?.inspection?.results?.critical{
            switch crit{
            case 0..<2:
                violationColor.backgroundColor = UIColor.init(red: 0.07, green: 0.67, blue: 0.04, alpha: 1.0)
            //cell.backgroundColor = UIColor.green
            case 2..<4:
                violationColor.backgroundColor = UIColor.init(red: 0.89, green: 0.89, blue: 0.00, alpha: 1.0)
                //cell.textLabel?.textColor = UIColor.yellow
            //cell.backgroundColor = UIColor.yellow
            case 4..<6:
                violationColor.backgroundColor = UIColor.orange
            default:
                violationColor.backgroundColor = UIColor.red
                
            }
        }
        
        let x = item?.inspection?.results?.critical
         let criticalViolations = String(describing: x!)
        
        numberViolations.text = (("Critical Violations: ") + criticalViolations)
        
           violationInfo.text = item?.inspection?.comments
        let geocoder = CLGeocoder()
        let address = (item?.establishment?.address)!
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if let error = error {
                print(error)
            }
            //print("AAAAAAAHHHH ")
            
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                let annotation = MKPointAnnotation()
                //annotation.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                annotation.coordinate = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
                annotation.title = address
                //print("TITLE: ", annotation.title!)
                self.mapView.addAnnotation(annotation)
                
                let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
                let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinates, span)
                self.mapView.setRegion(region, animated: true)
            }
    })

    
        
        // Do any additional setup after loading the view.
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
