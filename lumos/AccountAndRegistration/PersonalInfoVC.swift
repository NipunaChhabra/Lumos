//
//  PasswordInfoViewController.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/8/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import UIKit

class PersonalInfoVC: UIViewController {
    
    //var RegUser : User!
    

    lazy var PersonalInfo: UILabel = {
        let label = UILabel()
        label.headerLabel()
        label.text = "Personal Info"
        return label
    }()
    
    lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.stepLabel()
        label.text = "Step 1/3"
        return label
    }()
    
    lazy var firstName : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        txtfield.cutomizeTextFields(name: "First Name")
        txtfield.keyboardType = .default
        txtfield.autocorrectionType = .no
        txtfield.clipsToBounds = true
        txtfield.addTarget(self, action: #selector(handleInput), for: .editingChanged)
        return txtfield
        
    }()
    
    lazy var lastName : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        txtfield.cutomizeTextFields(name: "Last Name")
        txtfield.keyboardType = .default
        txtfield.autocorrectionType = .no
        txtfield.clipsToBounds = true
        txtfield.addTarget(self, action: #selector(handleInput), for: .editingChanged)
        return txtfield
    }()
    
    lazy var emailField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        txtfield.cutomizeTextFields(name: "Email Field")
        txtfield.keyboardType = .emailAddress
        txtfield.autocorrectionType = .no
        txtfield.autocapitalizationType = .none
        txtfield.clipsToBounds = true
        txtfield.addTarget(self, action: #selector(handleInput), for: .editingChanged)
        return txtfield
    }()
    
    lazy var NextNavigation : UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1)
        btn.setImage(UIImage(systemName: "greaterthan.circle.fill"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 45)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.addTarget(self, action: #selector(onNextTapped(_ :)), for: .touchUpInside)
        btn.isEnabled = false
        return btn
    }()

    override func viewDidLoad() {
            super.viewDidLoad()
            //RegUser = User()
            view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            setupLayout()
            observeKeyboardNotifications()
    }

    func setupLayout(){
        
        view.addSubview(PersonalInfo)
        _ = PersonalInfo.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 302, heightConstant: 49)
        PersonalInfo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        view.addSubview(stepLabel)
        _ = stepLabel.anchor(top: PersonalInfo.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 14, leftConstant: 21, bottomConstant: 0, rightConstant: 45, heightConstant: 22)
        
        view.addSubview(firstName)
        _ = firstName.anchor(top: stepLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 14, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        
        view.addSubview(lastName)
        _ = lastName.anchor(top: firstName.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        
        view.addSubview(emailField)
        _ = emailField.anchor(top: lastName.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        emailField.keyboardType = .emailAddress
        emailField.autocorrectionType = .no
        emailField.autocapitalizationType = .none
        
        view.addSubview(NextNavigation)
        _ = NextNavigation.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 20, rightConstant: 40, widthConstant: 55, heightConstant: 55)
    }

        
    @objc func handleInput(){
        let isFormValid = emailField.text?.isEmpty != true && firstName.text?.isEmpty != true && lastName.text?.isEmpty != true
            
        
        if isFormValid {
            NextNavigation.isEnabled = true
        }
        else{
        //NextNavigation.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        NextNavigation.isEnabled = false
        }
    }
    
    @objc func onNextTapped(_ sender: UIButton){
        if validateEmail(enteredEmail: emailField.text!){
//            RegUser.firstName = firstName.text!
//            RegUser.lastName = lastName.text!
//            RegUser.email = emailField.text!
            
            show(CreatePassVC(), sender: sender)}
        else{
//            FloatingMessage().floatingMessage(Message: "Invalid Email Address", Color: .red, onPresentation: {self.emailField.becomeFirstResponder()}){} //todo
        }
    }

    func validateEmail(enteredEmail: String) -> Bool { //todo
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: enteredEmail)
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
