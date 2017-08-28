//
//  ViewModelType.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/28.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
protocol ViewModelType {
    associatedtype Input
    associatedtype Output    
    func transform(input: Input) -> Output
}
