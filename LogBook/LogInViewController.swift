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
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtpassword: UITextField!
    
    @IBAction func btnlogin(_ sender: Any) {
         _ =  Firebase.instance.rx_signInWithEmail(email: txtemail.text!, password:txtpassword.text!).subscribe(
            onNext: {
                (user) in
                let mapnavigator  = MainInterFaceNavigator(storyBoard: self.storyboard!,navigationController: self.navigationController!)
                mapnavigator.toMap()
                print(user.email ?? "no real data")
        },
            onError: {
                (error) in
                print(error.localizedDescription)
        }, onCompleted: {
            print("hello")
        }) {
            print("diposed")
        }
        
        
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
