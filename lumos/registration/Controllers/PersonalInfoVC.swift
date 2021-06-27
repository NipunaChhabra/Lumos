//
//  PasswordInfoViewController.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/8/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import UIKit

class PersonalInfoVC: UIViewController {
    
    var RegUser : User!
    

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
        btn.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btn.setImage(UIImage(systemName: "greaterthan.circle.fill"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 60)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.addTarget(self, action: #selector(onNextTapped(_ :)), for: .touchUpInside)
        btn.isEnabled = false
        return btn
    }()

    override func viewDidLoad() {
            super.viewDidLoad()
            RegUser = User()
            view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            setupLayout()
    }

    func setupLayout(){
        
        view.addSubview(PersonalInfo)
        _ = PersonalInfo.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 302, heightConstant: 49)
        PersonalInfo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        view.addSubview(stepLabel)
        _ = stepLabel.anchor(top: PersonalInfo.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 15, leftConstant: 21, bottomConstant: 0, rightConstant: 45, heightConstant: 22)
        
        view.addSubview(firstName)
        _ = firstName.anchor(top: stepLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        
        view.addSubview(lastName)
        _ = lastName.anchor(top: firstName.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        
        view.addSubview(emailField)
        _ = emailField.anchor(top: lastName.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        emailField.keyboardType = .emailAddress
        emailField.autocorrectionType = .no
        emailField.autocapitalizationType = .none
        
        view.addSubview(NextNavigation)
        _ = NextNavigation.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 23, rightConstant: 43, widthConstant: 60, heightConstant: 60)
    }

        
    @objc func handleInput(){
        let isFormValid = emailField.text?.isEmpty != true && firstName.text?.isEmpty != true && lastName.text?.isEmpty != true
        
        if isFormValid {
            NextNavigation.tintColor = #colorLiteral(red: 0.08184012932, green: 0.8078371051, blue: 0.5886109668, alpha: 1)
            NextNavigation.isEnabled = true
        }
        else{
        NextNavigation.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        NextNavigation.isEnabled = false
        }
    }
    
    @objc func onNextTapped(_ sender: UIButton){
        if validateEmail(enteredEmail: emailField.text!){
            RegUser.firstName = firstName.text!
            RegUser.lastName = lastName.text!
            RegUser.email = emailField.text!
            
            show(CreatePassVC(), sender: sender)}
        else{
            FloatingMessage().floatingMessage(Message: "Invalid Email Address", Color: .red, onPresentation: {self.emailField.becomeFirstResponder()}){} //todo
        }
    }

    func validateEmail(enteredEmail: String) -> Bool { //todo
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: enteredEmail)
    }

}
