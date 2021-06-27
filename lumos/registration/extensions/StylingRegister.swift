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
        //tintColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
        configure(color: #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1), font: UIFont(name: "Montserrat-Medium", size: 18)!, cornerRadius: 20, borderColor: #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1), backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), borderWidth: 1.5)
        translatesAutoresizingMaskIntoConstraints = false
        attributedPlaceholder = NSAttributedString(string: name, attributes: [
            .foregroundColor: #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1),
            .font: UIFont(name: "Montserrat-Medium", size: 18)!
            ])
    }
}

extension UILabel{
    func headerLabel(){
       textColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
       font = UIFont(name: "Montserrat-Bold", size: 36)
       textAlignment = NSTextAlignment.left
    }
    
    func stepLabel(){
       textColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
       font = UIFont(name: "Montserrat-Bold", size: 18)
       textAlignment = NSTextAlignment.left
    }
}

