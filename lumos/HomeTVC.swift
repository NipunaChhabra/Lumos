//
//  ViewController.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit

protocol HomeTVCLogin {
    func finishLoggingIn()
}
class HomeTVC: UITabBarController, HomeTVCLogin {
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        setupTabBar()
//        for family: String in UIFont.familyNames
//        {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {print("== \(names)")}
//        }
    }
    
    func finishLoggingIn(){
        self.dismiss(animated: true, completion: {})
        setupTabBar()
    }
    
    fileprivate func isLoggedIn()->Bool{
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
//        return true
    }


    func setupTabBar(){
        
        tabBar.backgroundColor = UIColor(named: "whiteblack")
        tabBar.unselectedItemTintColor = UIColor(named:"text")
        tabBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//       tabBar.tintColor = UIColor(named: "barTint")
        tabBar.isTranslucent = false
        
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
        
        var tab4 = UINavigationController(rootViewController: AccountVC())
        
        if isLoggedIn(){
            let acc = AccountVC()
//            acc.user = Caching.getUserDetailsFromCache(self.user
            tab4 = UINavigationController(rootViewController: acc)
            print("tab4loggedinloaded")
        }else{
            tab4 = UINavigationController(rootViewController: LandingVC())
            print("tab4landingloaded")
        }

        setViewControllers([tab1, tab2, tab3, tab4], animated: false)
        
        guard let items = tabBar.items else {
            return
        }
//
        UINavigationBar.appearance().barTintColor = UIColor(named: "navBar")
        
        items[0].image = UIImage(named: "blog icon")
        items[1].image = UIImage(named: "event")
        items[2].image = UIImage(systemName: "chevron.left.slash.chevron.right")
        items[3].image = UIImage(systemName: "person")
        
    }
}


