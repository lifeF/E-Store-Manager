//
//  LogInController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/25/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit

class LogInController: UIViewController {
    let profileImageView = UIImageView()
    let inputViewConstrain = UIView()
    
    let NameTextField      = UITextField()
    let EmailTextField      = UITextField()
    let PasswordTextField      = UITextField()
    
    let RegisterButton     = UIButton(type:.system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        
        //profile init
        profileImageView.image = UIImage(named:"profile")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        
        // initiate inputs view container
        inputViewConstrain.backgroundColor = UIColor.white
        inputViewConstrain.translatesAutoresizingMaskIntoConstraints = false
        inputViewConstrain.layer.cornerRadius = 5
        inputViewConstrain.layer.masksToBounds = true
        
        // initiate register button
        RegisterButton.backgroundColor = UIColor(r: 80, g: 91, b: 151)
        RegisterButton.translatesAutoresizingMaskIntoConstraints = false
        RegisterButton.setTitle("Register", for: .normal)
        RegisterButton.layer.borderColor = UIColor.gray.cgColor
        RegisterButton.layer.borderWidth = 1
        RegisterButton.layer.cornerRadius = 5
        RegisterButton.layer.masksToBounds = true
        RegisterButton.setTitleColor(UIColor.white, for: .normal)
        
        
        // initiate nameTextField
        NameTextField.placeholder = "Name"
        NameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        EmailTextField.placeholder = "Email"
        EmailTextField.translatesAutoresizingMaskIntoConstraints  = false
        
        PasswordTextField.placeholder = "Password"
        PasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        PasswordTextField.isSecureTextEntry = true
        
        //add profile to view controller
        view.addSubview(profileImageView)
        
        // add inputs view container to view
        view.addSubview(inputViewConstrain)
        
        // add button to view
        view.addSubview(RegisterButton)
        
        
        //CONSTRAINS ----------------------------
        
        //add profile constain
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: inputViewConstrain.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        //  add Text field to inputs container
        inputViewConstrain.addSubview(NameTextField)
        inputViewConstrain.addSubview(EmailTextField)
        inputViewConstrain.addSubview(PasswordTextField)
        
        // setting constrains of  inputs View container
        inputViewConstrain.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputViewConstrain.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputViewConstrain.widthAnchor.constraint(equalTo: view.widthAnchor,constant:-24).isActive = true
        inputViewConstrain.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // setting constrains of  Register Button
        RegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        RegisterButton.topAnchor.constraint(equalTo: inputViewConstrain.bottomAnchor, constant:10 ).isActive = true
        RegisterButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        RegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        // text field Constrains
            // >> name
            NameTextField.leftAnchor.constraint(equalTo: inputViewConstrain.leftAnchor,constant:12 ).isActive = true
            NameTextField.topAnchor.constraint(equalTo: inputViewConstrain.topAnchor).isActive = true
            NameTextField.rightAnchor.constraint(equalTo: inputViewConstrain.rightAnchor,constant: -12).isActive = true
            NameTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: 1/3).isActive = true
        
            //Email
            EmailTextField.leftAnchor.constraint(equalTo: inputViewConstrain.leftAnchor,constant:12 ).isActive = true
            EmailTextField.topAnchor.constraint(equalTo: NameTextField.bottomAnchor).isActive = true
            EmailTextField.rightAnchor.constraint(equalTo: inputViewConstrain.rightAnchor,constant: -12).isActive = true
            EmailTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: 1/3).isActive = true
        
            //Password
            PasswordTextField.leftAnchor.constraint(equalTo: inputViewConstrain.leftAnchor,constant:12 ).isActive = true
            PasswordTextField.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor).isActive = true
            PasswordTextField.rightAnchor.constraint(equalTo: inputViewConstrain.rightAnchor,constant: -12).isActive = true
            PasswordTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: 1/3).isActive = true
        
        //END CONSTRAINS
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor{
    convenience init(r: CGFloat , g: CGFloat  ,b:CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}


