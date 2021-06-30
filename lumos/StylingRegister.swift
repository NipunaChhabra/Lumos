//
//  StylingRegister.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/23/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func cutomizeTextFields(name: String){
        //darkmode
//        configure(color: #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1), font: UIFont(name: "Montserrat-Medium", size: 18)!, cornerRadius: 20, borderColor: #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1), backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), borderWidth: 1.5)
//        translatesAutoresizingMaskIntoConstraints = false
//        attributedPlaceholder = NSAttributedString(string: name, attributes: [
//            .foregroundColor: #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1),
//            .font: UIFont(name: "Montserrat-Medium", size: 18)!
//            ])
        
        configure(color: #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1), font: UIFont(name: "Montserrat-Medium", size: 18)!, cornerRadius: 20, borderColor: #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1), backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), borderWidth: 1.5)
        translatesAutoresizingMaskIntoConstraints = false
        attributedPlaceholder = NSAttributedString(string: name, attributes: [
            .foregroundColor: #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1),
            .font: UIFont(name: "Montserrat-Medium", size: 18)!
            ])
        
    }
}

extension UILabel{
    func headerLabel(){
        textColor = #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1)
       //textColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
       font = UIFont(name: "Montserrat-Bold", size: 36)
       textAlignment = NSTextAlignment.left
    }
    
    func stepLabel(){
        textColor = #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1)
       //textColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
       font = UIFont(name: "Montserrat-Bold", size: 18)
       textAlignment = NSTextAlignment.left
    }
    
    
}

//extension UIButton {
//    func setColoredTitle(){
//        let string = NSMutableAttributedString(string: "TechnicalProphet.", attributes:[NSAttributedString.Key.font : UIFont(name: "OpenSans-ExtraBold", size: 22)!])
//        string.setColorForText("Technical", with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
//        string.setColorForText("Prophet.", with: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
//        setAttributedTitle(string, for: .normal)
//        setImage(UIImage(named: "3dots"), for: .normal)
//    }
//
//    open override func layoutSubviews() {
//        super.layoutSubviews()
//        if imageView != nil {
//            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
//            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
//        }
//    }
//}

extension NSMutableAttributedString{
    func setColorForText(_ textToFind: String, with color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    }
}



