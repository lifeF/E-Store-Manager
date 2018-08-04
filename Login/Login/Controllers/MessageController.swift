//
//  MessageController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/27/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

var users = [User]()

class MessageController: UITableViewController {
    let cellid = "id01"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancleMessage))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        fatchUser()
    }
    
    func fatchUser(){
        Database.database().reference().child("user").observe(.childAdded, with:{ (snap) in
            if let dic = snap.value as? [String: String]{
                let user = User()
                user.name    = dic["name"]
                user.email   = dic["email"]
                user.profile = dic["profile"]
                users.append(user)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }, withCancel: nil)
    }

    
    @objc func cancleMessage(){
        self.dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        // image from url
        if let url = user.profile{
                cell.imageView?.sd_setImage(with: URL(string: url),
                                            placeholderImage: UIImage(named: "userprofile"))
        }
        return cell
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}




