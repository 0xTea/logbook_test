//
//  SideMenuViewController.swift
//  LogBook
//
//  Created by Tshepo on 2017/08/28.
//  Copyright © 2017 Tshepo. All rights reserved.
//

import UIKit

class SideMenuViewController: UITableViewController {
    var navs=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navs = ["My Trips", "Vehicles", "Log out"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return navs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "sidemenu", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = navs[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }
//    {
//        if(navs[indexPath.row].contains("Track My Parcel"))
//        {
//            let trackParcel = self.storyboard?.instantiateViewController(withIdentifier: "TrackParcel") as? TrackParcel
//            self.navigationController?.pushViewController(trackParcel!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Become a Franchisee"))
//        {
//            let becomeFranchisee = self.storyboard?.instantiateViewController(withIdentifier: "BecomeFranchisee") as? BecomeFranchisee
//            self.navigationController?.pushViewController(becomeFranchisee!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Become a Customer"))
//        {
//            let becomeCustomer = self.storyboard?.instantiateViewController(withIdentifier: "BecomeCustomer") as? BecomeCustomer
//            self.navigationController?.pushViewController(becomeCustomer!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Quick Quote"))
//        {
//            let quickQuote = self.storyboard?.instantiateViewController(withIdentifier: "QuickQuote") as? QuickQuote
//            self.navigationController?.pushViewController(quickQuote!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("About Us"))
//        {
//            let aboutUs = self.storyboard?.instantiateViewController(withIdentifier: "AboutUs") as? AboutUs
//            self.navigationController?.pushViewController(aboutUs!, animated: true)
//
//        }
//        else if(navs[indexPath.row].contains("Login"))
//        {
//            let login = self.storyboard?.instantiateViewController(withIdentifier: "Login") as? Login
//            self.navigationController?.pushViewController(login!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Conditions of Carriage"))
//        {
//            let url = URL(string: "http://fastway.co.za/images/legal/FastwayCouriersConditionsOfCarriage.pdf")
//            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//        }
//        else if(navs[indexPath.row].contains("Log Out"))
//        {
//            SwiftSpinner.show("Exiting ...")
//
//            let firebaseAuth = FIRAuth.auth()
//            do
//            {
//                try firebaseAuth?.signOut()
//                SwiftSpinner.hide()
//                exit(0)
//
//            }
//            catch //let signOutError as NSError
//            {
//                SwiftSpinner.hide()
//                self.ErrorSignOutDialogBox()
//            }
//        }
//        else if(navs[indexPath.row].contains("Collect My Parcel"))
//        {
//            let collectParcel = self.storyboard?.instantiateViewController(withIdentifier: "CollectParcel") as? CollectParcel
//            self.navigationController?.pushViewController(collectParcel!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Order Stock"))
//        {
//            let selectedRegion = UserDefaults.standard.string(forKey: "regionCode") as! String
//
//            let cartview = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
//            cartview?.regioncode = selectedRegion
//            self.navigationController?.pushViewController(cartview!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Online Enquiry"))
//        {
//            let onlineEnquiry = self.storyboard?.instantiateViewController(withIdentifier: "OnlineEnquire") as? OnlineEnquire
//            self.navigationController?.pushViewController(onlineEnquiry!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Talk to Us"))
//        {
//            let onlineEnquiry = self.storyboard?.instantiateViewController(withIdentifier: "TalkToUs") as? TalkToUs
//            self.navigationController?.pushViewController(onlineEnquiry!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Contact Us"))
//        {
//            let contactUs = self.storyboard?.instantiateViewController(withIdentifier: "ContactUs") as? ContactUs
//            self.navigationController?.pushViewController(contactUs!, animated: true)
//        }
//        else if(navs[indexPath.row].contains("Register"))
//        {
//            let register = self.storyboard?.instantiateViewController(withIdentifier: "Register") as? Register
//            self.navigationController?.pushViewController(register!, animated: true)
//        }
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



