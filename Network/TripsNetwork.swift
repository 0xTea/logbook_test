//
//  TripsNetwork.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import Domain
import RxSwift

public final class TripNetWork {
    
    private let network: Network<Trip>
    
    init(network: Network<Trip>) {
        self.network = network
    }
    
    public func fetchAlbums() -> Observable<[Trip]> {
        return network.getItems("albums")
}
}
