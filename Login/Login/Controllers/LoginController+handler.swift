//
//  LoginController+handler.swift
//  Login
//
//  Created by Kalana Dhananjaya  on 7/29/18.
//  Copyright © 2018 Kalana Dhananjaya . All rights reserved.
//

import UIKit

extension LogInController : UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    
    @objc func imageSelector(){
        let ImagePicker = UIImagePickerController()
        ImagePicker.delegate = self
        ImagePicker.allowsEditing = true
        //ImagePicker.isEditing = true
        present(ImagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        let selectedImage : UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            profileImageView.image = editedImage
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            profileImageView.image = originalImage
        }
        
        
//        profileImageView.image = selectedImage
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       print("cancle")
       dismiss(animated: true, completion: nil)
    }
    
}
