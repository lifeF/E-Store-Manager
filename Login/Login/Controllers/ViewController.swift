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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(hanndleNewMessage))
        if (Auth.auth().currentUser?.uid == nil){
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
        }
        else{
            let uid = Auth.auth().currentUser?.uid
            let UserRef = Database.database().reference().child("user").child(uid!).observe(.value, with: { (snap) in
                //print(snap.value!)
                
                
                
                if let dic = snap.value! as? [String : AnyObject] {
                  self.navigationItem.title = dic["name"] as? String
                }
                
            }, withCancel: nil)
            
            
        }
    }
    
    @objc func hanndleNewMessage(){
        let NewMessageController = MessageController()
        let NavController = UINavigationController(rootViewController: NewMessageController)
        
        present(NavController, animated: true, completion: nil)
        
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

