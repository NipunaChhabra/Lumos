//
//  EventVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit
private let reuseIdentifier = "Cell"
class EventCategoriesVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var categories = [EventCategories]()
    
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
        
//        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        self.collectionView!.register(EventCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        navigationItem.titleView = titleLabel
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.isScrollEnabled = true
        navigationController?.navigationBar.isTranslucent = false
        
        let service = EventService(baseUrl: "https://test.istemanipal.com/api/")
        service.getAllCategories(endPoint: "/category")
        service.completionHandler { [weak self] (category, status, message) in
            if status {
               guard let self = self else {return}
                guard let _categories = category?.active else {return}
                self.categories = _categories
                self.collectionView.reloadData()
            }
    }

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3//categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCategoriesCollectionViewCell
        
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.layer.cornerRadius = 10
        //cell.category = categories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let item = categories[indexPath.row]
//        let itemSize = item.active.description.size(withAttributes: [
//                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
//                ])
//        return .init(width: view.frame.width-20, height: 200+itemSize.height)
        return .init(width: view.frame.width-20, height: 250)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let EventV = EventVC()
        //EventV.events = categories[indexPath.item].events
        show(EventV, sender: self)
    }
    
}
