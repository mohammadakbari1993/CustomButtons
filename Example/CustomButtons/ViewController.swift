//
//  ViewController.swift
//  CustomButtons
//
//  Created by mohammadakbari1993 on 09/13/2022.
//  Copyright (c) 2022 mohammadakbari1993. All rights reserved.
//

import UIKit
import CustomButtons

class ViewController: UIViewController {

   
    private var nameTxt : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Please insert your name"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor.systemGray5
        textField.layer.cornerRadius = 8
        return textField
    }()
    
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
    
    private var sign_up_Button : CustomButton!
    
    private var sign_in_Button : CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.systemBackground
        createButtons()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func createButtons() {
     
        // Create signIn button
        self.sign_in_Button = CustomButton(with: .withSubTitle(title: "I have an account",
                                                   subtitle: "Please log-in",
                                                   tintColor: .white,
                                                   textsAlignment: .center)) {
            self.presentViewController(storyBoardName: .Main, Identifier: AppControllers.LoginViewController, presentType: .pushController)
        }
        sign_in_Button.backgroundColor = UIColor.systemBlue
        
        // Create Register button
        
        self.sign_up_Button = CustomButton(with: .withIconAndSubtitle(iconName: "person.crop.circle.badge.plus",
                                                          title: "Register",
                                                          subtitle: "You agree our policy",
                                                          tintColor: .white,
                                                          textsAlignment: .center)) {
            self.saveAUser()
        }
        
        sign_up_Button.backgroundColor = UIColor.systemGreen
        
        self.setFramesAndSubviews()
        
    }

    
    private func setFramesAndSubviews() {
        
        self.nameTxt.frame = CGRect(x: 16, y: 66, width: self.view.frame.width - 36, height: 50)
        self.userNameTxt.frame = CGRect(x: 16, y: 132, width: self.view.frame.width - 36, height: 50)
        self.passwordTxt.frame = CGRect(x: 16, y: 198, width: self.view.frame.width - 36, height: 50)
        self.sign_up_Button.frame = CGRect(x: 8, y: self.view.frame.height - 106, width: (self.view.frame.width / 2) - 16, height: 50)
        self.sign_in_Button.frame = CGRect(x: (self.view.frame.width / 2) + 8, y: self.view.frame.height - 106, width: (self.view.frame.width / 2) - 16, height: 50)
    
        self.view.addSubview(nameTxt)
        self.view.addSubview(userNameTxt)
        self.view.addSubview(passwordTxt)
        self.view.addSubview(sign_up_Button)
        self.view.addSubview(sign_in_Button)
        
    }
    
    func saveAUser() {
        
        let user = User(name: nameTxt.text ?? "",
                        userName: userNameTxt.text ?? "",
                        password: passwordTxt.text ?? "")
       
        UserDefaultManager.shared.addUserToUserDefaults(user: user) {
           
            self.emptyInputs()
            
            let message = "Your users list is : \n \(UserDefaultManager.shared.readUsersList().usersList.compactMap({$0.userName}))"
            
            AlertManager.showSimpleAlert(title: "Success", message: message, buttonTitle: "Ok", on: self)
            
        } unsuccess: {ErrorMessage in
            AlertManager.showSimpleAlert(title: "Error!!!", message: ErrorMessage, buttonTitle: "Ok", on: self)
        }

    }
    
    

}


extension ViewController {
    func emptyInputs() {
        self.userNameTxt.text = ""
        self.passwordTxt.text = ""
        self.nameTxt.text = ""
    }
}

