//
//  LandingVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/29/21.
//

import UIKit

class LandingVC: UIViewController {
    
    lazy var signUpBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.1529411765, blue: 0.2078431373, alpha: 1)
        //btn.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)//darkmode
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        //btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)//darkmode
        if isSmalliPhone(){
          btn.titleLabel?.font = UIFont(name: "Montserrat-Mesium", size: 15)
        }else{
            btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 20)
        }
        //btn.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 15.0
        btn.addTarget(self, action: #selector(onSignupTapped(_ :)), for: .touchUpInside)
        return btn
    }()

    lazy var loginBtn : UIButton = {
      let btn = UIButton()
        btn.setTitle("Already have an account? Login", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.06666666667, green: 0.1529411765, blue: 0.2078431373, alpha: 1), for: .normal)
        //btn.setTitleColor(#colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1), for: .normal)//darkmode
        if isSmalliPhone(){
            btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 10)
        }else{
            btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 16)
        }
        btn.addTarget(self, action: #selector(onlogintapped(_ :)), for: .touchUpInside)
        return btn
    }()



    lazy var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 10, height: view.frame.height))
        //label.text = "TechnicalProphet"
        let string = NSMutableAttributedString(string: "Login.")
        string.setColorForText("Login", with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        string.setColorForText(".", with: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        label.attributedText = string
        //label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "OpenSans-ExtraBold", size: 22)
        label.textAlignment = NSTextAlignment.left


        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        navigationItem.titleView = titleLabel
        setupLayout()
    }


    func setupLayout(){
        view.addSubview(signUpBtn)
        view.addSubview(loginBtn)

        _ = loginBtn.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 80, rightConstant: 30, widthConstant: 0, heightConstant: 50)

        _ = signUpBtn.anchor(top: nil, left: nil, bottom:loginBtn.topAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 5, rightConstant: 0, widthConstant: 200, heightConstant: 35)

        let centerX = signUpBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([centerX])
    }

    @objc func onlogintapped(_ sender: UIButton){
        let vc = LoginVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func onSignupTapped(_ sender: UIButton){
        show(PersonalInfoVC(), sender: sender)
    }

}
