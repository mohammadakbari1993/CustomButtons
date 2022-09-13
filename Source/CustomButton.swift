//
//  CustomButton.swift
//  CustomButtons
//
//  Created by Mohammad on 9/13/22.
//


import UIKit

enum ButtonTypes {
    case normal(title : String , tintColor : UIColor? , textAlignment : NSTextAlignment?)
    case withSubTitle(title : String , subtitle : String , tintColor : UIColor? , textsAlignment : NSTextAlignment?)
    case withIconAndSubtitle(iconName : String, title : String, subtitle : String , tintColor : UIColor? , textsAlignment : NSTextAlignment?)
}

class CustomButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var titleLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private var subtitleLbl : UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    private var iconImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var typeOfButton : ButtonTypes = .normal(title: "Button",tintColor: nil, textAlignment: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private var buttonAction: (()->Void)?
    
    init(with Type : ButtonTypes , action : (()->Void)?) {
        super.init(frame: .zero)
        
        self.buttonAction = action
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.secondarySystemBackground
        
        self.typeOfButton = Type
  
        switch Type {
            
        case .normal(title: let title,let tintColor, textAlignment: let textAlignment):
          
            self.configureButtonForNormal(title : title)
            self.titleLbl.textAlignment = textAlignment ?? .center
       
            if let color = tintColor {
         
                self.titleLbl.textColor = color
    
            }
            
        case .withSubTitle(title: let title, subtitle: let subtitle,let tintColor, textsAlignment: let textsAlignment):
          
            self.configureButtonForSubtitle(title: title, subtitle: subtitle)
            self.titleLbl.textAlignment = textsAlignment ?? .center
            self.subtitleLbl.textAlignment = textsAlignment ?? .center
       
            if let color = tintColor {
                self.subtitleLbl.textColor = color
                self.titleLbl.textColor = color
 
            }
            
        case .withIconAndSubtitle(let iconName,let title,let subtitle, let tintColor,  let textsAlignment):
           
            self.configureButtonForImageView(icon: iconName, title: title, subtitle: subtitle)
            self.titleLbl.textAlignment = textsAlignment ?? .center
            self.subtitleLbl.textAlignment = textsAlignment ?? .center
           
            if let color = tintColor {
                self.subtitleLbl.textColor = color
                self.titleLbl.textColor = color
                self.iconImage.tintColor = color
            }
            
        }

        
    }
    

    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        buttonAction?()
    }
    
    
    private func configureButtonForNormal(title : String) {
       
        self.titleLbl.text = title
        self.addSubview(titleLbl)
    
    
    }
    
    private func configureButtonForSubtitle(title : String, subtitle : String) {
        
        self.titleLbl.text = title
        self.subtitleLbl.text = subtitle
        
        self.addSubview(titleLbl)
        self.addSubview(subtitleLbl)
        
    }
    
    private func configureButtonForImageView(icon : String, title : String, subtitle : String) {
       
        self.titleLbl.text = title
        self.subtitleLbl.text = subtitle
        
        self.addSubview(titleLbl)
        self.addSubview(subtitleLbl)
        
        if let image = UIImage(named: icon) {
            self.iconImage.image = image
            self.addSubview(self.iconImage)
        } else if let image = UIImage(systemName: icon) {
            self.iconImage.image = image
            self.addSubview(self.iconImage)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch self.typeOfButton {
            
        case .normal(_, _, _):
          
            self.titleLbl.frame = CGRect(x: 4,
                                         y: 4,
                                         width: self.frame.width - 8 ,
                                         height: self.frame.height - 8 ).integral
      
        case .withSubTitle(_, _, _, _):
            
           
            self.titleLbl.frame = CGRect(x: 4,
                                         y: 4,
                                         width: self.frame.width - 8 ,
                                         height: (self.frame.height / 2) - 8 ).integral
           
            self.subtitleLbl.frame = CGRect(x: 4,
                                            y: (self.frame.height / 2) + 4,
                                            width: self.frame.width - 8 ,
                                            height: (self.frame.height / 2) - 8).integral
            
        case .withIconAndSubtitle(_, _, _, _, _):
            
            
            self.titleLbl.frame = CGRect(x: 54,
                                         y: 4,
                                         width: self.frame.width - 58 ,
                                         height: (self.frame.height / 2) - 8 ).integral
           
            self.subtitleLbl.frame = CGRect(x: 54,
                                            y: (self.frame.height / 2) + 4,
                                            width: self.frame.width - 58 ,
                                            height: (self.frame.height / 2) - 8).integral
            
            self.iconImage.frame = CGRect(x: 4,
                                          y: 4,
                                          width: 50,
                                          height: self.frame.height - 8).integral
           
            
        }
        
    }

}

