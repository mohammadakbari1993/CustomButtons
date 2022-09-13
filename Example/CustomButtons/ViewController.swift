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

    private var myBtn1 : CustomButton = {
        let btn = CustomButton(with: .withIconAndSubtitle(iconName: "bag",
                                                          title: "Title of Button",
                                                          subtitle: "Subttile or description of button", tintColor: UIColor.blue,
                                                          textsAlignment: .left), action: {
            print("Button Tapped")
        })
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        return btn
    }()
    
    private var myBtn2 : CustomButton = {
       
        let btn = CustomButton(with: .normal(title: "Title of Button",
                                             tintColor: UIColor.red,
                                             textAlignment: .center)) {
            print("Normal Button tapped")
        }
        
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        
        return btn
        
    }()
    
    private var myBtn3 : CustomButton = {
        let btn = CustomButton(with: .withSubTitle(title: "Title of Button",
                                                   subtitle: "Subttile or description of button",
                                                   tintColor: UIColor.darkGray,
                                                   textsAlignment: .center)) {
            print("Button with subtitle tapped")
        }
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        return btn
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myBtn1.center = self.view.center
        self.myBtn1.frame.origin.y = (self.view.frame.height / 2) - 110
        
        self.myBtn2.center = self.view.center
        
        self.myBtn3.center = self.view.center
        self.myBtn3.frame.origin.y = (self.view.frame.height / 2) + 60
        
        
        self.view.addSubview(myBtn1)
        self.view.addSubview(myBtn2)
        self.view.addSubview(myBtn3)
    }


}

