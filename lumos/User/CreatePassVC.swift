//
//  CreatePassVC.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/23/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import UIKit

class CreatePassVC: UIViewController {
    
    //var RegUser : User!
    
    lazy var CreatePasswordLabel: UILabel = {
        let label = UILabel()
        label.headerLabel()
        label.text = "Create Password"
        return label
    }()
    
    lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.stepLabel()
        label.text = "Step 2/3"
        return label
    }()
    
    lazy var passwordTextField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Password"
        txtfield.cutomizeTextFields(name: "Password")
        txtfield.autocapitalizationType = .none
        txtfield.autocorrectionType = .no
        txtfield.addTarget(self, action: #selector(handleInput), for: .editingChanged)
        return txtfield
    }()
    
    lazy var ConfirmPasswordField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Confirm Password"
        txtfield.cutomizeTextFields(name: "Confirm Password")
        txtfield.autocapitalizationType = .none
        txtfield.autocorrectionType = .no
        txtfield.addTarget(self, action: #selector(handleInput), for: .editingChanged)
        return txtfield
    }()
    
    lazy var warningBtn : UIButton = {
      let btn = UIButton()
        btn.setTitle("the password must be 8 characters", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 15)
        return btn
    }()

    lazy var NextNavigation : UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1)
        btn.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 60)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(onNextTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //observeKeyboardNotifications()
        //title = "Registration Step 2/3"
        setupLayout()
        observeKeyboardNotifications()

    }
    
    func setupLayout(){
        
        view.addSubview(CreatePasswordLabel)
        _ = CreatePasswordLabel.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 317, heightConstant: 44)
        CreatePasswordLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        view.addSubview(stepLabel)
        _ = stepLabel.anchor(top: CreatePasswordLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 15, leftConstant: 21, bottomConstant: 0, rightConstant: 45, heightConstant: 22)
        
        view.addSubview(passwordTextField)
        _ = passwordTextField.anchor(top: stepLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 40, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        passwordTextField.isSecureTextEntry = true
        
        view.addSubview(ConfirmPasswordField)
        _ = ConfirmPasswordField.anchor(top: passwordTextField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        ConfirmPasswordField.isSecureTextEntry = true
        
        view.addSubview(warningBtn)
        _ = warningBtn.anchor(top: ConfirmPasswordField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 40, bottomConstant: 0, rightConstant: 0, widthConstant: 350, heightConstant: 17)
        
        view.addSubview(NextNavigation)
        _ = NextNavigation.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 23, rightConstant: 43, widthConstant: 60, heightConstant: 60)
    }
    
@objc func handleInput(){
    let isFormValid = passwordTextField.text?.isEmpty != true && ConfirmPasswordField.text?.isEmpty != true
    
    if isFormValid {
        //NextNavigation.tintColor = #colorLiteral(red: 0.08184012932, green: 0.8078371051, blue: 0.5886109668, alpha: 1)
        NextNavigation.isEnabled = true
    }
    else{
    //NextNavigation.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    NextNavigation.isEnabled = false
    }
}
    
    @objc func onNextTapped(_ sender: UIButton){
        guard let password = passwordTextField.text else { return }
        if (passwordTextField.text != ConfirmPasswordField.text){
//            FloatingMessage().floatingMessage(Message: "Passwords do not match", Color: .red, onPresentation: {
//                self.ConfirmPasswordField.becomeFirstResponder()
//            }) {}
            return
        }
        if (password.count < 8){
//            FloatingMessage().floatingMessage(Message: "password length less than 8", Color: .red, onPresentation: {
//                self.ConfirmPasswordField.becomeFirstResponder()
//            }) {}
            return
        }
            show(MobileDetailVC(), sender: sender)
    }
    
    fileprivate func observeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
            }, completion: nil)
    }
    
    @objc func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: -220, width: self.view.frame.width, height: self.view.frame.height)
            
            }, completion: nil)
    }
    

        
}
