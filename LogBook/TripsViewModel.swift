 //
//  TripsViewModel.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/28.
//  Copyright © 2017 Tshepo. All rights reserved.
//

 import Foundation
 import Domain
 import RxSwift
 import RxCocoa
 
 
 final class TripsViewModel :ViewModelType
 {
    private let useCase: AllTripsUseCase
    private let navigator: MainInterFaceNavigator
    
    init(useCase: AllTripsUseCase, navigator: MainInterFaceNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    struct Input{
        let trigger: Driver<Void>
        let createPostTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
    
    struct Output{
        let trigger: Driver<Void>
        let createPostTrigger: Driver<Void>
        let selection: Driver<IndexPath>
    }
        
    func transform(input:Input) -> Output {
        return
        
    }
    
    
 
 }

