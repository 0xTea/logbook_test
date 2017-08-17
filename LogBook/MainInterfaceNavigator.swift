//
//  MainInterfaceNavigator.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/17.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import UIKit

protocol Navigator {
    func toMap()
    func totrips()
    func tovehicles()
    func tosignout()
}

final class MainInterFaceNavigator :Navigator{
    
    private let navigationController: UINavigationController
    private let storyBoard: UIStoryboard
    
    init(storyBoard: UIStoryboard,
         navigationController : UINavigationController) {
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    func tosignout() {
    
        
    }
    
    func tovehicles() {
        
    }
    
    func totrips() {
        
    }
    
    func toMap() {
        let vc = storyBoard.instantiateViewController(ofType: MapViewController.self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
