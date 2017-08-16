//
//  ViewController.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/14.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cdNavigationController = UINavigationController()
    
       override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSignup(_ sender: Any) {
        // we can only do this as we know for certain  that we have a nvigation controller thats has been embedded  into the rootviewcontroller
        let signupNavigator  = UserDetailsNavigator(storyBoard: self.storyboard!,navigationController: self.navigationController!)
        signupNavigator.toSignUp()
    }

    @IBAction func btnLogin(_ sender: Any) {
        let loginNavigator  = UserDetailsNavigator(storyBoard: self.storyboard!,navigationController: self.navigationController!)
        loginNavigator.toSignIn()
    }
}

