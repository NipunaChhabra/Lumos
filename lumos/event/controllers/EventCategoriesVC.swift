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
        string.setColorForText("Categories.", with: UIColor(named: "yellow")!)
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
        collectionView.backgroundColor = UIColor(named: "whiteblack")
        collectionView.isScrollEnabled = true
        navigationController?.navigationBar.isTranslucent = false
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.tintColor = UIColor(named: "text")
        let rightBarButtonItem = UIBarButtonItem()
       rightBarButtonItem.customView = btn
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        let service = EventService(baseUrl: "https://test.istemanipal.com/api/")
        service.getAllCategories(endPoint: "category")
        service.completionHandler { [weak self] (cat, status, message) in
            if status {
                guard let self = self else {return}
                guard let _cat = cat?.active else {return}
                self.categories = _cat
               self.collectionView.reloadData()
            }
        }
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(categories.count)
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCategoriesCollectionViewCell
        
        cell.backgroundColor = UIColor(named: "background")
        cell.layer.cornerRadius = 10
        cell.category = categories[indexPath.item]
        //print(categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let category = categories[indexPath.row]
        //var itemSize = CGSize(width: 0,height: 50)
        guard let itemSize = category.description?.size(withAttributes: [
            NSAttributedString.Key.font : UIFont(name: "Montserrat-Medium", size: 25)!
                ])
        else{
            //let itemSize = CGSize(width: 50,height: 50)
            print("else block mein aa gaya")
            return .init(width: view.frame.width-20, height: 250)
        }
        print("height is \(itemSize.height)")
        return .init(width: view.frame.width-20, height: 300+itemSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let events = categories[indexPath.item].events{
            let VC = EventVC(collectionViewLayout: UICollectionViewFlowLayout())
            VC.events = events
            VC.titleLabel.text = categories[indexPath.item].name
            show(VC, sender: self)
        }else{
            let VC = DummyVC()
            VC.titleLabel.text = categories[indexPath.item].name
            VC.Info.text = "No Events"
        }

    }
    
}
