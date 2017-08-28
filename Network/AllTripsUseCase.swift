//
//  AllTripsUseCase.swift
//  Network
//
//  Created by Tshepo on 2017/08/28.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import Domain
import RxSwift

final class AllTripsUseCase: Domain.AllTripsUseCase {
    private let network: TripNetwork
    
    init(network: PostsNetwork) {
        self.network = network
    }
    
    func posts() -> Observable<[]> {
        let fetchPosts = cache.fetchObjects().asObservable()
        let stored = network.fetchPosts()
            .flatMap {
                return self.cache.save(objects: $0)
                    .asObservable()
                    .map(to: [Post].self)
                    .concat(Observable.just($0))
        }
        
        return fetchPosts.concat(stored)
    }
}

struct MapFromNever: Error {}
extension ObservableType where E == Never {
    func map<T>(to: T.Type) -> Observable<T> {
        return self.flatMap { _ in
            return Observable<T>.error(MapFromNever())
        }
    }
}
