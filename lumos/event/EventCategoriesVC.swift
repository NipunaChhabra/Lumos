//
//  EventVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit

private let reuseIdentifier = "Cell"
class EventCategoriesVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //var category = category()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 10, height: view.frame.height))
        let string = NSMutableAttributedString(string: "EventCategories.")
        string.setColorForText("Event", with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        string.setColorForText("Categories.", with: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        label.attributedText = string
        label.font = UIFont(name: "OpenSans-ExtraBold", size: 22)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = titleLabel
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.isScrollEnabled = true
        navigationController?.navigationBar.isTranslucent = false
        
//        let service = Service(baseUrl: "https://test.istemanipal.com/api/")
//        service.getall(endPoint: "/category")
//        service.completionHandler { [weak self] (category, status, message) in
//            if status {
//                guard let self = self else {return}
//                guard let _category = category else {return}
//                self.category = _category
//                self.collectionView.reloadData()
//            }
//        }
//    }

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1//blogs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCategoriesCollectionViewCell
        
        cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //cell.blog = blogs[indexPath.item]
        return cell
    }
    
    
}
