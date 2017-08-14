//
//  AllTripsUseCase.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import RxSwift

public protocol AllTripsUseCase{
    
    func alltrips()-> Observable<[Trip]>
}
