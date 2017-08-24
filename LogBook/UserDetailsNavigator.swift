//
//  UserDetailsNavigator.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import Foundation
import Domain

protocol DetailsNavigator {
    //the single responbility of this class would be navigate through customer registration details
    func toSignIn()
    func toSignUp()
}

final class  UserDetailsNavigator : DetailsNavigator{
    
    private let navigationController: UINavigationController
    private let storyBoard: UIStoryboard
    
    init(storyBoard: UIStoryboard,
         navigationController : UINavigationController) {
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func toSignIn()
    {
        let vc = storyBoard.instantiateViewController(ofType: LogInViewController.self)
        navigationController.pushViewController(vc, animated: true)
    }
    func toSignUp()
    {
        let vc = storyBoard.instantiateViewController(ofType: SignUpController.self)
        navigationController.pushViewController(vc, animated: true)
    }
    func toMain()
    {
        let vc = storyBoard.instantiateViewController(ofType: ViewController.self)
        navigationController.pushViewController(vc, animated: true)
    }
}
