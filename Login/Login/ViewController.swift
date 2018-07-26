//
//  ViewController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/25/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))
        if (Auth.auth().currentUser?.uid == nil){
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
        }
    }
    
    @objc func handleLogOut(){
        do{
            try Auth.auth().signOut()
        }
        catch let SignOutError{
            print(SignOutError)
        }
        let Login = LogInController()
        present(Login, animated: true, completion: nil)
    }
    
    


}

