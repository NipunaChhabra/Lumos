//
//  LoginVC.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/4/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    lazy var LoginBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.1529411765, blue: 0.2078431373, alpha: 1)
        //btn.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)//darkmode
        btn.setTitle("LOGIN", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        //btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)//darkmode
        if isSmalliPhone(){
          btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 20)
        }else{
            btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 28)
        }
        //btn.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 15.0
        btn.addTarget(self, action: #selector(onLoginTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    lazy var UsernameTextField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Username"
        txtfield.cutomizeTextFields(name: "Username")
        return txtfield
    }()
    
    lazy var PasswordTextField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Password"
        txtfield.cutomizeTextFields(name: "Password")
        return txtfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //title = "Login"
        setupLayout()

    }
    
    func setupLayout(){
        view.addSubview(UsernameTextField)
        view.addSubview(PasswordTextField)
        view.addSubview(LoginBtn)
        
        _ = LoginBtn.anchor(top: nil, left: nil, bottom:view.safeAreaLayoutGuide.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 50, rightConstant: 0, widthConstant: 200, heightConstant: 35)
        let centerX = LoginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([centerX])
        
        _ = UsernameTextField.anchor(top: nil, left: view.leftAnchor, bottom:PasswordTextField.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 5, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        

        _ = PasswordTextField.anchor(top: nil, left: view.leftAnchor, bottom:LoginBtn.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 5, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        
    }
    
    func validateEmail(enteredEmail: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    @objc func onLoginTapped(_ sender: UIButton){
       
    }
}
