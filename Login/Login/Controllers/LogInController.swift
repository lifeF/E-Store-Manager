//
//  LogInController.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/25/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit
import Firebase

class LogInController: UIViewController {
    
    let profileImageView = UIImageView()
    let SegmentedControl = UISegmentedControl(items: ["Login","Register"])
    let inputViewConstrain = UIView()
    
    let NameTextField      = UITextField()
    let EmailTextField     = UITextField()
    let PasswordTextField  = UITextField()
    
    let RegisterButton     = UIButton(type:.system)
    
    var heightOfInputsContainer : NSLayoutConstraint?
    var nameInputFieldHeightConstraint: NSLayoutConstraint?
    var emailInpurHeightConstraint : NSLayoutConstraint?
    var passwordInpurHeightConstraint : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 61, g: 191, b: 150)
        
        //profile init
        profileImageView.image = UIImage(named:"profile")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.contentMode = .scaleAspectFill
        
        //init Segmented
        SegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        SegmentedControl.tintColor = UIColor.white
        SegmentedControl.selectedSegmentIndex = 1
        
        
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
        RegisterButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        
       
        
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
        
        // add segmented control
        view.addSubview(SegmentedControl)
        
        // add inputs view container to view
        view.addSubview(inputViewConstrain)
        
        // add button to view
        view.addSubview(RegisterButton)
        
        
        
        //CONSTRAINS ----------------------------
        
        //add profile constain
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: SegmentedControl.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        //  add segmented control constrain
        SegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        SegmentedControl.bottomAnchor.constraint(equalTo: inputViewConstrain.topAnchor, constant : -12).isActive = true
        SegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        SegmentedControl.widthAnchor.constraint(equalTo: inputViewConstrain.widthAnchor).isActive = true
        SegmentedControl.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        
        
        
        //  add Text field to inputs container
        inputViewConstrain.addSubview(NameTextField)
        inputViewConstrain.addSubview(EmailTextField)
        inputViewConstrain.addSubview(PasswordTextField)
        
        // setting constrains of  inputs View container
        inputViewConstrain.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputViewConstrain.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputViewConstrain.widthAnchor.constraint(equalTo: view.widthAnchor,constant:-24).isActive = true
        heightOfInputsContainer = inputViewConstrain.heightAnchor.constraint(equalToConstant: 150)
        heightOfInputsContainer?.isActive = true
        
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
            nameInputFieldHeightConstraint = NameTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: 1/3)
            nameInputFieldHeightConstraint?.isActive = true
        
            //Email
            EmailTextField.leftAnchor.constraint(equalTo: inputViewConstrain.leftAnchor,constant:12 ).isActive = true
            EmailTextField.topAnchor.constraint(equalTo: NameTextField.bottomAnchor).isActive = true
            EmailTextField.rightAnchor.constraint(equalTo: inputViewConstrain.rightAnchor,constant: -12).isActive = true
            emailInpurHeightConstraint = EmailTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: 1/3)
            emailInpurHeightConstraint?.isActive = true
        
            //Password
            PasswordTextField.leftAnchor.constraint(equalTo: inputViewConstrain.leftAnchor,constant:12 ).isActive = true
            PasswordTextField.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor).isActive = true
            PasswordTextField.rightAnchor.constraint(equalTo: inputViewConstrain.rightAnchor,constant: -12).isActive = true
            passwordInpurHeightConstraint = PasswordTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: 1/3)
            passwordInpurHeightConstraint?.isActive = true
        
        //END CONSTRAINS
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
    // handle Segmented control
    @objc func handleSegmentedControl(_sender : UISegmentedControl){
        let title:String? = SegmentedControl.titleForSegment(at: SegmentedControl.selectedSegmentIndex)
        RegisterButton.setTitle(title, for: .normal)
        
        heightOfInputsContainer?.constant = SegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        // name text field change
        nameInputFieldHeightConstraint?.isActive = false
        nameInputFieldHeightConstraint = NameTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: SegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameInputFieldHeightConstraint?.isActive = true
        
        // email text field change
        emailInpurHeightConstraint?.isActive = false
        emailInpurHeightConstraint = EmailTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: SegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailInpurHeightConstraint?.isActive = true
        
        // password text field change
        passwordInpurHeightConstraint?.isActive = false
        passwordInpurHeightConstraint = PasswordTextField.heightAnchor.constraint(equalTo: inputViewConstrain.heightAnchor, multiplier: SegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordInpurHeightConstraint?.isActive = true
    }
    
    // handle Register Button
    @objc func handleRegister(){
        guard let email=EmailTextField.text , let password = PasswordTextField.text
        else{
            print("form is not valid")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print(error ?? "error")
                return
            }

            // successfully authentication
            guard let uid = Auth.auth().currentUser?.uid
            else{
                return
            }

            var ref: DatabaseReference!
            let value = ["name":self.NameTextField.text,"email":self.EmailTextField.text]
            ref = Database.database().reference(fromURL: "https://store-incore.firebaseio.com/")

            let userRef = ref.child(byAppendingPath: "user").child(byAppendingPath:uid)
            userRef.updateChildValues(value, withCompletionBlock:{(error,ref)
                in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                print("successfly added to the firebase db")
                self.dismiss(animated: true, completion: nil)
            })
        }
        
        
        
      
        
        
        
    }
}

extension UIColor{
    convenience init(r: CGFloat , g: CGFloat  ,b:CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}


