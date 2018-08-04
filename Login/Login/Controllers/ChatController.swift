//
//  ChatController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/31/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ChatController: UICollectionViewController {
    let Message = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.backgroundColor = UIColor.white
        setupInputComponant()
        // Do any additional setup after loading the view.
    }
    
    func setupInputComponant(){
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.backgroundColor = UIColor.red
        
        view.addSubview(containerView)
        
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let SendButton = UIButton(type: .system)
        SendButton.setTitle("Send", for: .normal)
        SendButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(SendButton)
        
        SendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        SendButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        SendButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        SendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor ).isActive = true
        
        Message.placeholder = "  Enter Message .."
        Message.translatesAutoresizingMaskIntoConstraints = false
        
        
        Message.layer.borderColor = UIColor.gray.cgColor
        
        containerView.addSubview(Message)
        
        Message.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        Message.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 2).isActive = true
        Message.heightAnchor.constraint(equalTo: containerView.heightAnchor ,constant: -4).isActive = true
        Message.rightAnchor.constraint(equalTo: SendButton.leftAnchor, constant: -2).isActive = true
        
        let separateLine = UIView()
        separateLine.translatesAutoresizingMaskIntoConstraints = false
        separateLine.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        
        containerView.addSubview(separateLine)
        
        separateLine.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        separateLine.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        separateLine.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        separateLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        SendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        
    }
    
    @objc func sendMessage(){
        print("Send Message")
    }

}
