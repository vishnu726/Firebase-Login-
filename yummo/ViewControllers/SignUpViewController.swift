//
//  SignUpViewController.swift
//  yummo
//
//  Created by Vishnu on 02/10/19.
//  Copyright © 2019 Vishnu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    var ref: DatabaseReference!
    var selectedImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        //Username Text Field
        usernameTextField.backgroundColor = UIColor.clear
        usernameTextField.tintColor = UIColor.white
        usernameTextField.textColor = UIColor.white
        usernameTextField.attributedPlaceholder = NSAttributedString(string: usernameTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let usernamebottomLayer = CALayer()
        usernamebottomLayer.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        usernamebottomLayer.backgroundColor =  UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        usernameTextField.layer.addSublayer(usernamebottomLayer)
        
        //Email Text Field
        emailTextField.backgroundColor = UIColor.clear
        emailTextField.tintColor = UIColor.white
        emailTextField.textColor = UIColor.white
        emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let emailbottomLayer = CALayer()
        emailbottomLayer.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        emailbottomLayer.backgroundColor =  UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        emailTextField.layer.addSublayer(emailbottomLayer)
        
        //Password Text Field
        passwordTextField.backgroundColor = UIColor.clear
        passwordTextField.tintColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1.0, alpha: 0.6)])
        let passwordbottomLayer = CALayer()
        passwordbottomLayer.frame = CGRect(x: 0, y: 29, width: 1000, height: 0.6)
        passwordbottomLayer.backgroundColor =  UIColor(red: 50/255, green: 50/255, blue: 25/255, alpha: 1).cgColor
        passwordTextField.layer.addSublayer(passwordbottomLayer)
        
        //Profile Image
        profileImage.layer.cornerRadius = 40
        profileImage.clipsToBounds = true
        
        let tapGuesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(tapGuesture)
        profileImage.isUserInteractionEnabled = true
    }
    
    @objc func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        pickerController.delegate = self
        present(pickerController,animated: true, completion: nil)
    }
    
    @IBAction func signupBtn(_ sender: Any) {
    
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!)  { (user, error) in
            
            if let error = error {
                debugPrint(error)
                return
            }
            let storageRef = Storage.storage().reference(forURL: "gs://yummo-a450c.appspot.com/").child("profile_image")
            
            self.ref.child("users").childByAutoId().setValue(["username": self.usernameTextField.text,"email":self.emailTextField.text])
        }
    }

    
    @IBAction func disconnectBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
         print("did finish picking media")
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage{
           profileImage.image = image
            selectedImage = image
        }

        dismiss(animated: true, completion: nil)
    }

}
