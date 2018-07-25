//
//  ViewController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/25/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))
    }
    
    @objc func handleLogOut(){
        print("run")
        let Login = LogInController()
        present(Login, animated: true, completion: nil)
        
    }
    
    


}

