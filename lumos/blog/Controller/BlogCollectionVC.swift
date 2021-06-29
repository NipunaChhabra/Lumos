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
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-10, height: view.frame.height))
        let string = NSMutableAttributedString(string: "TechnicalProphet.")
        string.setColorForText("Technical", with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        string.setColorForText("Prophet.", with: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        label.attributedText = string
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
        
//        let button = UIButton(frame: CGRect(x: 0,y: 100000,width: view.frame.width-2000000,height: 10))
//        button.setImage(UIImage(named: "3dots"), for: .normal)
//        //button.addTarget(self, action: "showMessage:", forControlEvents: .TouchUpInside)
//
//        let rightBarButtonItem = UIBarButtonItem()
//
//        rightBarButtonItem.customView = button
//
//        self.navigationItem.rightBarButtonItem = rightBarButtonItem

        
        
        
//        let moreButton = UIBarButtonItem(image: UIImage(named: "3dots")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
//        navigationItem.setRightBarButtonItems([moreButton], animated: false)
        
        
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
        show(blogView, sender: self)
    }

    

    
//    let settingsLauncher = SettingsLauncher()
//    @objc func handleMore() {
//        settingsLauncher.showSettings()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
