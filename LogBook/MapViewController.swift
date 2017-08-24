//
//  MapViewController.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/17.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController , CLLocationManagerDelegate,MKMapViewDelegate{
    
let initialLocation = CLLocation(latitude: -26.195246, longitude: 28.034088)
     var userlocation = CLLocation()
    
       var second  = PersonIcon()
        var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
                mapview?.delegate = self
        mapview?.userTrackingMode = .follow
        mapview?.showsUserLocation = true
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector (revealRegionDetailsWithLongPressOnMap(gesture:)))
        uilpgr.minimumPressDuration = 2.0
        mapview?.addGestureRecognizer(uilpgr)
        
        //Check for Location Services
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        //Zoom to user location
        let noLocation = CLLocationCoordinate2D()
        let viewRegion = MKCoordinateRegionMakeWithDistance(noLocation, 200, 200)
        mapview?.setRegion(viewRegion, animated: false)
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func revealRegionDetailsWithLongPressOnMap(gesture: UILongPressGestureRecognizer) {
        
        if gesture.state != UIGestureRecognizerState.began { return }
        let touchLocation = gesture.location(in:  self.mapview)
        let locationCoordinate =    self.mapview?.convert(touchLocation, toCoordinateFrom: self.mapview)
        
        drawpin(latitude: (locationCoordinate?.latitude),longitude: (locationCoordinate?.longitude))
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawpin(latitude:Double?,longitude:Double?){
        
         let second = PersonIcon(title: "My Next Location",
                             locationName: "Far",
                             discipline: "Sculpture",
                             coordinate: CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!))
    mapview?.addAnnotation(second)
        
        print(distanceA_B(location_2:second))
        
    }
    
    func distanceA_B( location_2:PersonIcon)->Double{
        
        let noLocation = CLLocationCoordinate2D()
        let pointALocation = CLLocation(latitude: noLocation.latitude, longitude: noLocation.longitude)
        let pointBCoordinate = location_2.coordinate
        
        let pointBLocation = CLLocation(latitude: pointBCoordinate.latitude, longitude: pointBCoordinate.longitude)
        let distanceMeters = pointALocation.distance(from: pointBLocation)
        
        
        
        let destinationCoordinates = CLLocationCoordinate2DMake(location_2.coordinate.latitude, location_2.coordinate.longitude)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinates, addressDictionary: nil)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        // Create request
        let request = MKDirectionsRequest ()
        let user = CLLocationCoordinate2DMake(userlocation.coordinate.latitude, userlocation.coordinate.longitude)
        
        //let sourcePlacemark = MKPlacemark(coordinate: user, addressDictionary: nil)
        let sourceMapItem = MKMapItem.forCurrentLocation()
        
        request.source = sourceMapItem
        request.destination = destinationMapItem
        request.transportType = MKDirectionsTransportType.automobile
        request.requestsAlternateRoutes = false
        let directions = MKDirections(request: request)
        
        directions.calculate {
            response, error in
            if let route = response?.routes.first {
                
                print("Distance: \(route.distance/1000), ETA: \(route.expectedTravelTime)")
            } else {
                let alert = UIAlertController(title: nil,
                                              message: "Directions not available.", preferredStyle: .Alert)
                let okButton = UIAlertAction(title: "OK",
                                             style: .Cancel) { (alert) -> Void in
                                                self.navigationController?.popViewControllerAnimated(true)
                }
                alert.addAction(okButton)
                self.presentViewController(alert, animated: true,
                                           completion: nil)
            }
        }
        
        return 0
    }
    @IBOutlet weak var mapview :MKMapView?
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapview?.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        let location = locations.last as! CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapview?.setRegion(region, animated: true)
        self.userlocation = location
        
        
        // Get destination position
        
        let pointBLocation = CLLocation(latitude: second.coordinate.latitude, longitude: second.coordinate.longitude)
        let distanceMeters = pointBLocation.distance(from: pointBLocation)
        
        
        
        let destinationCoordinates = CLLocationCoordinate2DMake(second.coordinate.latitude, second.coordinate.longitude)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinates, addressDictionary: nil)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        // Create request
        let request = MKDirectionsRequest()
        
        let sourcePlacemark = MKPlacemark(coordinate: location.coordinate, addressDictionary: nil)
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        
        request.source = sourceMapItem
        request.destination = destinationMapItem
        request.transportType = MKDirectionsTransportType.automobile
        request.requestsAlternateRoutes = false
        let directions = MKDirections(request: request)
        
        directions.calculate {
            response, error in
            if let route = response?.routes.first {
                
                print("Distance: \(route.distance), ETA: \(route.expectedTravelTime)")
            } else {
                print(error?.localizedDescription)
            }
        }
        
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}


