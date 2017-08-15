//
//  UseCaseProvider.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
public protocol UseCaseProvider {
    func getAllTrips()->AllTripsUseCase
}
