//
//  AccountVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit

class AccountVC: UIViewController {
    
    lazy var signUpBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
        btn.setTitle("Sign Up", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        if isSmalliPhone(){
          btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 22)
        }else{
            btn.titleLabel?.font = UIFont(name: "Montserrat-Bold", size: 30)
        }
        btn.layer.borderColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 25.0
       // btn.addTarget(self, action: #selector(onSignupTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    lazy var loginBtn : UIButton = {
      let btn = UIButton()
        btn.setTitle("Already have an account? Login", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1), for: .normal)
        if isSmalliPhone(){
            btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 12)
        }else{
            btn.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 17)
        }
        //btn.addTarget(self, action: #selector(onlogintapped(_ :)), for: .touchUpInside)
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
        view.backgroundColor = #colorLiteral(red: 0.5258943439, green: 0.001558654243, blue: 0.7766222358, alpha: 0.9235805458)
        navigationItem.titleView = titleLabel
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
