//
//  BlogVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit
private let reuseIdentifier = "Cell"
class BlogCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var blogs = [Blog]()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 10, height: view.frame.height))
        //label.text = "TechnicalProphet"
        let string = NSMutableAttributedString(string: "TechnicalProphet")
        string.setColorForText(textForAttribute: "Technical", withColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        string.setColorForText(textForAttribute: "Prophet", withColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        label.attributedText = string
        //label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "OpenSans-ExtraBold", size: 22)
        label.textAlignment = NSTextAlignment.left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(BlogCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.isScrollEnabled = true
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.isTranslucent = false
        
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btn.addTarget(self, action: #selector(handleMore), for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem()
       rightBarButtonItem.customView = btn
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let service = Service(baseUrl: "https://blog.istemanipal.com/mobile/")
        service.getAllBlogs(endPoint: "blogPosts")
        service.completionHandler { [weak self] (blogs, status, message) in
            if status {
                guard let self = self else {return}
                guard let _blogs = blogs else {return}
                self.blogs = _blogs
               self.collectionView.reloadData()
            }
        }
        
        
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(blogs.count)
        return blogs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BlogCell
        
        cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.layer.cornerRadius = 10
        cell.blog = blogs[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width-20, height: 147)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let blogView = BlogLauncherViewController()
        blogView.blog = blogs[indexPath.item]
        navigationController?.pushViewController(blogView, animated: true)
        //push(blogView, sender: self)
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    func showControllerForSetting(setting: Setting) {
        var vc = UIViewController()
        let ac = AboutUsVC()
        let dc = DevelopersVC()
        if setting.name == "AboutUs"{
            vc = ac
        }
        else if setting.name == "Developers"{
            vc = dc
        }
        vc.navigationItem.title = setting.name
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.06666666667, green: 0.1529411765, blue: 0.2078431373, alpha: 1)
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleMore() {
        settingsLauncher.showSettings()
        
        
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
