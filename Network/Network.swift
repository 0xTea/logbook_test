//
//  Network.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Domain
import RxAlamofire
import RxSwift
import ObjectMapper

import Foundation

final class Network <T : BaseMappable>{
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ endPoint: String) {
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    func getItems(_ path: String) -> Observable<[T]> {
        let absolutePath = "\(endPoint)/\(path)"
        return RxAlamofire
            .json(.get, absolutePath)
            .debug()
            .observeOn(scheduler)
            .map({ json -> [T] in
                return  Mapper<T>().mapArray(JSONObject: json)!
            })
    }

}

