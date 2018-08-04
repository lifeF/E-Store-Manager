//
//  ViewController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/25/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class ViewController: UITableViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogOut))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(hanndleNewMessage))
        
    }
    // view again appear
    override func viewWillAppear(_ animated: Bool) {
        if (Auth.auth().currentUser?.uid == nil){
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
        }
        else{
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("user").child(uid!).observe(.value, with: { (snap) in
                print(snap)
                if let dic = snap.value! as? [String : String] {
//                    self.navigationItem.title = dic["name"] as? String
                    let user = User()
                    user.name    = dic["name"]
                    user.email   = dic["email"]
                    user.profile = dic["profile"]
                    self.setupNavBarwithUser(user: user)
                }
            }, withCancel: nil)
        }
    }
    
    func setupNavBarwithUser(user : User){
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        titleView.backgroundColor = UIColor.blue
//        let containerView = UIView()
//        containerView.backgroundColor = UIColor.red
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        titleView.addSubview(containerView)
////
//        let UserName = UILabel()
//        UserName.translatesAutoresizingMaskIntoConstraints = false
//        UserName.text = "kalasndasdas asdas"//user.name
//
//        let profileImage = UIImageView()
//        profileImage.translatesAutoresizingMaskIntoConstraints = false;
//        profileImage.layer.cornerRadius = 20
//        profileImage.clipsToBounds = true;
////
//        if let profileurl = user.profile{
//            profileImage.sd_setImage(with: URL(string: profileurl), placeholderImage: UIImage(named: "placeholder.png"))
//        }
//
//        containerView.addSubview(profileImage)
//        containerView.addSubview(UserName)
////
//        profileImage.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
//        profileImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
//        profileImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        profileImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
//
//        UserName.leftAnchor.constraint(equalTo: profileImage.rightAnchor ,constant: 8).isActive = true
//        UserName.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 8).isActive = true
//        UserName.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
//        UserName.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
//
//        containerView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
//        containerView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
    
        self.navigationItem.titleView = titleView
        
        titleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showChatController)))
    
    }
    
    @objc func showChatController(){
        print("kalana")
        let chatController = ChatController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(chatController, animated: true)
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

