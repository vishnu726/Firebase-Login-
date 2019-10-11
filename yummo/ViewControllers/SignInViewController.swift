//
//  SignInViewController.swift
//  yummo
//
//  Created by Vishnu on 02/10/19.
//  Copyright © 2019 Vishnu. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    


}
