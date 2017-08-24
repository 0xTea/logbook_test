//
//  PersonIcon.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/23.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import MapKit

class PersonIcon: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    override init() {
        self.title  = "Standard"
        self.locationName = "Standard"
        self.discipline = "Standard"
        self.coordinate = CLLocationCoordinate2D.init()
    }
    
  
    
    var subtitle: String? {
        return locationName
    }
}
