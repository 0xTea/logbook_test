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
    
    var userlocation = CLLocation()
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    var second  = PersonIcon()
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        mapview?.delegate = self
        mapview?.userTrackingMode = .follow
        mapview?.showsUserLocation = true
        self.navigationController!.navigationBar.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
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
        
        let destinationCoordinates = CLLocationCoordinate2DMake(location_2.coordinate.latitude, location_2.coordinate.longitude)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinates, addressDictionary: nil)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        // Create request
        let request = MKDirectionsRequest ()
        let sourceMapItem = MKMapItem.forCurrentLocation()
        
        request.source = sourceMapItem
        request.destination = destinationMapItem
        request.transportType = MKDirectionsTransportType.automobile
        request.requestsAlternateRoutes = false
        let directions = MKDirections(request: request)
        self.activityIndicator.startAnimating()
        directions.calculate {
            response, error in
            if let route = response?.routes.first {
                
                print("Distance: \(route.distance/1000)km, ETA: \(route.expectedTravelTime/60) mins")
                self.plotPolyline(route: route)
                self.activityIndicator.stopAnimating()
                } else {
                let alert = UIAlertController(title: nil,
                                              message: "Directions not available.", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK",
                                             style: .cancel) { (alert) -> Void in
                                                self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(okButton)
                self.present(alert, animated: true,
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
        
        
    }
    
    func plotPolyline(route: MKRoute) {
        mapview?.add(route.polyline)
        print(route.polyline)
        // 2
        if  mapview?.overlays.count == 1 {
            mapview?.setVisibleMapRect(route.polyline.boundingMapRect,
                                       edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0),
                                       animated: false)
        }// 3
        else {
            let polylineBoundingRect =  MKMapRectUnion( (mapview?.visibleMapRect)!,
                                                        route.polyline.boundingMapRect)
            mapview?.setVisibleMapRect(polylineBoundingRect,
                                       edgePadding: UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0),
                                       animated: false)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polylineRenderer = MKPolylineRenderer(overlay: overlay)
        if (overlay is MKPolyline) {
            if mapView.overlays.count == 1 {
                polylineRenderer.strokeColor =
                    UIColor.blue.withAlphaComponent(0.75)
            } else if mapView.overlays.count == 2 {
                polylineRenderer.strokeColor =
                    UIColor.green.withAlphaComponent(0.75)
            } else if mapView.overlays.count == 3 {
                polylineRenderer.strokeColor =
                    UIColor.red.withAlphaComponent(0.75)
            }
            polylineRenderer.lineWidth = 5
        }
        return polylineRenderer
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

