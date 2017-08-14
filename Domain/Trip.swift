//
//  Trip.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation

public struct Trip {
    
    public let tripId : String
    public let date : String
    public let purpose :String
    public let vehicle_id :String
    public let meters :Int
    public let timestamp_saved :String
    
    public init (tripId:String,
                 date:String,
                 purpose :String,
                 vehicle_id :String,
                 meters:Int,
                 timestamp_saved :String){
        self.tripId = tripId
        self.date = date
        self.purpose = purpose
        self.vehicle_id = vehicle_id
        self.meters = meters
        self.timestamp_saved = timestamp_saved
        
    }

}
