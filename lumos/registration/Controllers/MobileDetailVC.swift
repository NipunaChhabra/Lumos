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
        btn.tintColor = #colorLiteral(red: 0.1882352941, green: 0.9294117647, blue: 0.6196078431, alpha: 1)
        btn.setImage(UIImage(systemName: "greaterthan.circle.fill"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 60)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.addTarget(self, action: #selector(onNextTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
            let tabBarVC = UITabBarController()
            
            tabBarVC.tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            //tabBarVC.tabBar.tintColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
            tabBarVC.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6945673304, green: 0.6945673304, blue: 0.6945673304, alpha: 1)
            tabBarVC.tabBar.tintColor = #colorLiteral(red: 0.7254901961, green: 0.1019607843, blue: 0.1764705882, alpha: 1)
            
            let tab1 = UINavigationController(rootViewController: BlogViewController(collectionViewLayout: UICollectionViewFlowLayout()))
            let tab2 = UINavigationController(rootViewController: EventsCollectionVC(collectionViewLayout: UICollectionViewFlowLayout()))
            let tab3 = UINavigationController(rootViewController: DevelopersVC())
            let tab4 = UINavigationController(rootViewController: ProfileVC())

            
            tabBarVC.setViewControllers([tab1, tab2, tab3, tab4], animated: false)
            
            guard let items = tabBarVC.tabBar.items else {
                return
            }
    //
            items[0].image = UIImage(named: "blog icon")
            items[1].image = UIImage(named: "event")
            items[2].image = UIImage(systemName: "chevron.left.slash.chevron.right")
            items[3].image = UIImage(systemName: "person")
            
    //        let images = ["rectangle.doc","event","chevron.left.slash.chevron.right","person"]
    //
    //        for x in 0..<items.count {
    //            //items[x].image = UIImage(systemName: images[x])
    //            items[x].badgeColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
    //        }
            
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC, animated: true)
            //show(BlogViewController(collectionViewLayout: UICollectionViewFlowLayout()), sender: sender)
        }
    
    func validatePhoneNumber(enteredNumber: String) -> Bool {
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phonePredicate = NSPredicate(format:"SELF MATCHES %@", phoneNumberRegex)
        return phonePredicate.evaluate(with: enteredNumber)
    }
    


}
