//
//  EventVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

import UIKit
private let reuseIdentifier = "Cell"
class EventVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var events = [event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        //navigationItem.titleView = titleLabel
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.isScrollEnabled = true
        navigationController?.navigationBar.isTranslucent = false

        // Do any additional setup after loading the view.
    }
        
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
        
        
        override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //print(categories.count)
            return events.count
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCollectionViewCell
            
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.layer.cornerRadius = 10
            cell.event = events[indexPath.item]
            //print(events[indexPath.item])
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let event = events[indexPath.row]
            //var itemSize = CGSize(width: 0,height: 50)
            guard let itemSize = event.description?.size(withAttributes: [
                NSAttributedString.Key.font : UIFont(name: "Montserrat-Medium", size: 42)!
                    ])
            else{
                //let itemSize = CGSize(width: 50,height: 50)
                print("else block mein aa gaya")
                return .init(width: view.frame.width-20, height: 250)
            }
            //print("height is \(itemSize.height)")
            return .init(width: view.frame.width-20, height: 280+itemSize.height)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 20
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .init(top: 20, left: 10, bottom: 20, right: 10)
        }
}
