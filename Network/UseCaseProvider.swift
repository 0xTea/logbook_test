//
//  UseCaseProvider.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider:Domain.UseCaseProvider  {
    
    private let networkProvider: NetworkProvider
    public init() {
        networkProvider = NetworkProvider()
    }
        public func getAllTrips() -> AllTripsUseCase {
           // return AllTripsUseCase
    }
}
