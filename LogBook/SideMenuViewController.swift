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
}


