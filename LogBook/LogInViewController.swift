//
//  LogInViewController.swift
//
//
//  Created by Tshepo on 2017/08/15.
//
//

import UIKit

class LogInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user =  Firebase.instance.rx_signInWithEmail(email: "f@f.com", password: "ffffff").subscribe(
            onNext: {(user) in
        print(user.email ?? "no real data")
        }, onError: { (error) in
            print(error.localizedDescription)
        }, onCompleted: {
            print("hello")
        }) {
            print("diposed")
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
