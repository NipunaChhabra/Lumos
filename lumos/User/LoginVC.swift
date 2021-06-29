//
//  LoginVC.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/4/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    var user:User?
    
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
        txtfield.autocapitalizationType = .none
        txtfield.autocorrectionType = .no
        return txtfield
    }()
    
    lazy var PasswordTextField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Password"
        txtfield.cutomizeTextFields(name: "Password")
        txtfield.isSecureTextEntry = true
        txtfield.autocapitalizationType = .none
        txtfield.autocorrectionType = .no
        return txtfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //title = "Login"
        setupLayout()
        observeKeyboardNotifications()

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
    
    //var logindelegate = LoginDelegate?
    
    
    @objc func onLoginTapped(_ sender: UIButton){
        
        guard let username = UsernameTextField.text else {
//            FloatingMessage().floatingMessage(Message: "Username empty", Color: .red, onPresentation: {self.UsernameTextField.becomeFirstResponder()}){}
            return
        }
        guard let password = PasswordTextField.text else {
//            FloatingMessage().floatingMessage(Message: "Password empty", Color: .red, onPresentation: {self.PasswordTextField.becomeFirstResponder()}){}
            return
            
        }
        print(username)
        print(password)

        
        guard let url = URL(string: "https://test.istemanipal.com/api/login") else { return }
        
        var loginRequest = URLRequest(url: url)
        loginRequest.httpMethod = "POST"
        loginRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        do {
            let params = ["username": username, "password": password]
            loginRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init())
            
            URLSession.shared.dataTask(with: loginRequest) { (data, resp, err) in
                
//                if let response = resp {
//                    //print("response\(response)")
//                }
                if let data = data {
                    do {
                        self.user = try JSONDecoder().decode(User.self, from: data)
                        UserDefaults.standard.set(true,forKey: "isLoggedIn")
                        UserDefaults.standard.synchronize()
                    } catch {
                        print("error\(error)")
                    }
                }
                
            }.resume() // never forget this resume
        } catch {
            print("Failed to serialize data:", error)
        }
       
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
            
            self.view.frame = CGRect(x: 0, y: -200, width: self.view.frame.width, height: self.view.frame.height)
            
            }, completion: nil)
    }
    

}
