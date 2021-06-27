//
//  MobileDetailVC.swift
//  IsteProgrammatic
//
//  Created by Nipuna Chhabra on 10/23/20.
//  Copyright © 2020 Nipuna. All rights reserved.
//

import UIKit

struct RegisterResponse: Decodable{
    let status: Bool
    struct details: Decodable{
        let username: String
        let first_name: String
        let last_name: String
        let email: String
        let token: String
    }
    
    struct errors: Decodable{
        let username: String
    }
}

class MobileDetailVC: UIViewController {
    
    lazy var MobileNumLabel: UILabel = {
        let label = UILabel()
        label.headerLabel()
        label.text = "Mobile Number"
        return label
    }()
    
    lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.stepLabel()
        label.text = "Step 3/3"
        return label
    }()
    
    lazy var MobileNumTextField : LeftPaddedTextField = {
        let txtfield = LeftPaddedTextField()
        //txtfield.placeholder = "Mobile"
        txtfield.cutomizeTextFields(name: "Mobile")
        txtfield.keyboardType = .phonePad
        txtfield.autocorrectionType = .no
        txtfield.autocapitalizationType = .none
        txtfield.clipsToBounds = true
        return txtfield
    }()
    

    lazy var NextNavigation : UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1)
        btn.setImage(UIImage(systemName: "greaterthan.circle.fill"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 60)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.addTarget(self, action: #selector(onNextTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        //observeKeyboardNotifications()
        //title = "Registration Step 3/3"
        setupLayout()

    }
    
    func setupLayout(){
        view.addSubview(MobileNumLabel)
        _ = MobileNumLabel.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 317, heightConstant: 44)
        MobileNumLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        view.addSubview(stepLabel)
        _ = stepLabel.anchor(top: MobileNumLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 15, leftConstant: 21, bottomConstant: 0, rightConstant: 45, heightConstant: 22)
        
        view.addSubview(MobileNumTextField)
        _ = MobileNumTextField.anchor(top: stepLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 60, leftConstant: 21, bottomConstant: 0, rightConstant: 0, widthConstant: 332, heightConstant: 50)
        
        
        view.addSubview(NextNavigation)
        _ = NextNavigation.anchor(top: nil, left: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 23, rightConstant: 43, widthConstant: 60, heightConstant: 60)
    }
    
    @objc func onNextTapped(_ sender: UIButton){
        guard let number = MobileNumTextField.text else { return }
       
        if validatePhoneNumber(enteredNumber: number) == false{
            FloatingMessage().floatingMessage(Message: "Invalid Phone Number", Color: .red, onPresentation: {
                self.MobileNumTextField.becomeFirstResponder()
            }) {}
            return
            }
        }
    
    func validatePhoneNumber(enteredNumber: String) -> Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phonePredicate = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegex)
        return phonePredicate.evaluate(with: enteredNumber)
    }
    


}
