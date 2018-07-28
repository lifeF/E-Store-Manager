//
//  MessageController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/27/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit
import Firebase

class MessageController: UITableViewController {
    let cellid = "id01"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancleMessage))
        fatchUser()
        // Do any additional setup after loading the view.
    }
    
    func fatchUser(){
        let ref = Database.database().reference().child("users").observe(.childAdded) { (snap) in
            print(snap)
        }
    }

    
    @objc func cancleMessage(){
        print("ok")
        self.dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        cell.textLabel?.text = "dummy"
        
        return cell
    }
    

}



