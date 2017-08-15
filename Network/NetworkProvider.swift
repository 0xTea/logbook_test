//
//  NetworkProvider.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import Domain
final class NetworkProvider {
    private let apiEndpoint: String
    
    public init() {
        apiEndpoint = "https://jsonplaceholder.typicode.com"
    }
    
    public func makeTripsNetwork() -> TripNetWork {
        let network = Network<Trip>(apiEndpoint)
        return TripNetWork(network: network)
}
}
