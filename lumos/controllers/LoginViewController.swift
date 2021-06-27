//
//  LoginVC.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/4/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    lazy var signUpBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.1529411765, blue: 0.2078431373, alpha: 1)
        //btn.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)//darkmode
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        //btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)//darkmode
        if isSmalliPhone(){
          btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 20)
        }else{
            btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 28)
        }
        btn.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 25.0
        btn.addTarget(self, action: #selector(onSignupTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    lazy var UsernameTextField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Username"
        //txtfield.cutomizeTextFields(name: "Username")
        return txtfield
    }()
    
    lazy var PasswordTextField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Password"
        //txtfield.cutomizeTextFields(name: "Password")
        return txtfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        //title = "Login"
        setupLayout()

    }
    
    func setupLayout(){
        view.addSubview(LogInLabel)
        _ = SignInLabel.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 302, heightConstant: 49)
        SignInLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        

        
        view.addSubview(UsernameTextField)
        _ = UsernameTextField.anchor(top: descLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 47, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        
        view.addSubview(PasswordTextField)
        _ = PasswordTextField.anchor(top: UsernameTextField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        
    }
    
    func validateEmail(enteredEmail: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: enteredEmail)
    }
}
