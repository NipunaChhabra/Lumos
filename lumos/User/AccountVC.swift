//
//  AccountVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit

class AccountVC: UIViewController {
    
    var user: User!
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                if let user = Caching.sharedInstance.getUserDetailsFromCache() {
                    print(user)
                    self.user = user
                }else{
                    self.logOutUser()
                }
        }
    }
    
    
    lazy var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 10, height: view.frame.height))
        //label.text = "TechnicalProphet"
        let string = NSMutableAttributedString(string: "Profile.")
        string.setColorForText("Profile", with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        string.setColorForText(".", with: UIColor(named: "yellow")!)
        label.attributedText = string
        //label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "OpenSans-ExtraBold", size: 22)
        label.textAlignment = NSTextAlignment.left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleLabel
        view.backgroundColor = UIColor(named: "background")
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: "text")
        let rightBarButtonItem = UIBarButtonItem()
       rightBarButtonItem.customView = btn
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    lazy var NameLabel : UILabel = {
       let label = UILabel()
        label.text = "\(user.first_name!) \(user.last_name!)"
        label.textColor = UIColor(named: "text")
        label.font = UIFont(name: "Montserrat-Bold", size: 22)
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
          label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var scoreLabel : UILabel = {
       let label = UILabel()
        label.text = "score is"
        label.textColor = UIColor(named: "text")
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var submissionButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("View Submissions", for: .normal)
        //btn.setImage(UIImage(systemName: "link.badge.plus"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 18)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        //btn.addTarget(self, action: #selector(Button(_ :)), for: .touchUpInside)
        btn.tintColor = UIColor(named: "text")
        return btn
    }()
    
    lazy var logoutLabel : UIButton = {
       let label = UIButton()
        label.setTitle("LOGOUT", for: .normal)
        //label.configure(color: #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1), font:  UIFont(name: "Montserrat-Medium", size: 16)!,borderWidth: 0)
        label.configure(color: UIColor(named: "primary")!, font: UIFont(name: "Montserrat-Medium", size: 14)!, cornerRadius: 0, borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), borderWidth: 0)
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.addTarget(self, action: #selector(Button(_ :)), for: .touchUpInside)
        return label
    }()
    
    func setupLayout(){
        view.addSubview(NameLabel)
        view.addSubview(logoutLabel)
        view.addSubview(scoreLabel)
        view.addSubview(submissionButton)
        
        _ = NameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 180, heightConstant: 60)
        
        _ = logoutLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 68, heightConstant: 15)
        
    }
    
    func logOutUser(){
    UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
    UserDefaults.standard.synchronize()
    let vc = LandingVC()
    show(vc, sender: self)
    }

}
