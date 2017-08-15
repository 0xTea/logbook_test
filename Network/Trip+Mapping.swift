//
//  Trip+Mapping.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/15.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import Domain
import ObjectMapper

extension Trip: ImmutableMappable {
    // JSON -> Object
    public init(map: Map) throws {
        tripId = try map.value("tripId")
        date = try map.value("date")
        purpose = try map.value("purpose")
        vehicle_id = try map.value("vehicle_id")
        meters = try map.value("meters")
        timestamp_saved = try map.value("timestamp_saved")
    }
}
