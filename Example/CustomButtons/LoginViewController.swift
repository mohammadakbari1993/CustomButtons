//
//  LoginViewController.swift
//  CustomButtons_Example
//
//  Created by Bahman on 9/15/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import CustomButtons

class LoginViewController: UIViewController {
    
     private var userNameTxt : UITextField = {
         let textField = UITextField()
         textField.placeholder = "Please insert your user-name"
         textField.textAlignment = .center
         textField.backgroundColor = UIColor.systemGray5
         textField.layer.cornerRadius = 8
         return textField
     }()
     
     private var passwordTxt : UITextField = {
         let textField = UITextField()
         textField.placeholder = "Please insert your password"
         textField.textAlignment = .center
         textField.isSecureTextEntry = true
         textField.backgroundColor = UIColor.systemGray5
         textField.layer.cornerRadius = 8
         return textField
     }()
     

     private var sign_in_Button : CustomButton!
     
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.title = "Login"
         self.navigationController?.navigationBar.isHidden = false
         self.view.backgroundColor = UIColor.systemBackground
         createButtons()
     }
     
     func createButtons() {
      
         // Create signIn button
         self.sign_in_Button = CustomButton(with: .withSubTitle(title: "Login",
                                                    subtitle: "You'r session will be 30 Seconds",
                                                    tintColor: .white,
                                                    textsAlignment: .center)) {
             self.login()
         }
         sign_in_Button.backgroundColor = UIColor.systemBlue

         self.setFramesAndSubviews()
         
     }

     
     private func setFramesAndSubviews() {
         
         self.userNameTxt.frame = CGRect(x: 16, y: 106, width: self.view.frame.width - 36, height: 50)
         
         self.passwordTxt.frame = CGRect(x: 16, y: 172, width: self.view.frame.width - 36, height: 50)
         
         self.sign_in_Button.frame = CGRect(x: 32 , y: self.view.frame.height - 106, width: self.view.frame.width - 64, height: 50)
     
         self.view.addSubview(userNameTxt)
         self.view.addSubview(passwordTxt)
         self.view.addSubview(sign_in_Button)
         
     }
     
     func login() {
         
         let model = LoginModel(userName: self.userNameTxt.text ?? "",
                                password: self.passwordTxt.text ?? "")
         
         LoginManager.Login(model: model) { user in
             print(user)
         } unsuccess: { ErrorMessage in
             AlertManager.showSimpleAlert(title: "Error", message: ErrorMessage, buttonTitle: "Ok", on: self)
         }

         
         
     }
     
}
