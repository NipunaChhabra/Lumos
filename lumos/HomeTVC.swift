//
//  ViewController.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit

//protocol LoginDelegate{
//    func finishLoggingIn()
//}
class HomeTVC: UITabBarController{
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
//        for family: String in UIFont.familyNames
//        {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {print("== \(names)")}
//        }
    }
    
//    func finishLoggingIn(){
//        print("logged in successfully..")
//    }
    
    fileprivate func isLoggedIn()->Bool{
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }


    func setupTabBar(){
        
        tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6945673304, green: 0.6945673304, blue: 0.6945673304, alpha: 1)
       tabBar.tintColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        
        let tab1 = UINavigationController(rootViewController: BlogCollectionVC(collectionViewLayout: UICollectionViewFlowLayout()))
        let tab2 = UINavigationController(rootViewController: EventCategoriesVC(collectionViewLayout: UICollectionViewFlowLayout()))
        
        var tab3 = UINavigationController(rootViewController: DummyVC())
        if isLoggedIn(){
            let pvc = PracticeVC()
            //pvc.user = self.user!
            tab3 = UINavigationController(rootViewController: pvc)
        }else{
            tab3 = UINavigationController(rootViewController: DummyVC())
        }
        
        var tab4 = UINavigationController(rootViewController: LandingVC())
        if isLoggedIn(){
            let acc = AccountVC()
            //acc.user = self.user!
            tab4 = UINavigationController(rootViewController: acc)
        }else{
            tab4 = UINavigationController(rootViewController: LandingVC())
        }

        setViewControllers([tab1, tab2, tab3, tab4], animated: false)
        
        guard let items = tabBar.items else {
            return
        }
//
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.08235294118, green: 0.2039215686, blue: 0.2509803922, alpha: 1)
        
        items[0].image = UIImage(named: "blog icon")
        items[1].image = UIImage(named: "event")
        items[2].image = UIImage(systemName: "chevron.left.slash.chevron.right")
        items[3].image = UIImage(systemName: "person")
        
    }
    
    @objc func handleMore(){}

}


