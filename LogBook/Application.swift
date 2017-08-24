//
//  Application.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import Domain
import Network

final class Application {
    static let shared = Application()

    private let networkUseCaseProvider: Network.UseCaseProvider
    
    private init() {
        self.networkUseCaseProvider = Network.UseCaseProvider()
    }
    
    func configureUserAccountInterface(in window : UIWindow)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cdNavigationController = UINavigationController()
        window.rootViewController = cdNavigationController
        let mapnavigator  = UserDetailsNavigator(storyBoard: storyboard,navigationController: cdNavigationController)
        mapnavigator.toMain()

    }
    
    func  configureMainInterface(in window :UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let cdNavigationController = UINavigationController()
        window.rootViewController = cdNavigationController
        let mapnavigator  = MainInterFaceNavigator(storyBoard: storyboard,navigationController: cdNavigationController)
        mapnavigator.toMap()
    }
    
    
}

