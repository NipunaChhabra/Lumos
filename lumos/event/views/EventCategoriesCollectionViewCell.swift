//
//  EventCategoriesCollectionViewCell.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

import UIKit

class EventCategoriesCollectionViewCell: UICollectionViewCell {
    
//    var category:category?{
//        didSet{
//            
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bgImage : UIImageView = {
    let imageView = UIImageView()
        imageView.image = UIImage(named: "lumos")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.text = "title"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.center
          label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descLabel : UILabel = {
       let label = UILabel()
        label.text = "dhffhkjd kfhasdfkh fkajshfkjah fahsfkjh fkjhfjksd fsjkhaskJFH HFJKFH FKHkjh"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.clipsToBounds = true
        label.numberOfLines = 15
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupLayout(){
        addSubview(bgImage)
        addSubview(titleLabel)
        addSubview(descLabel)
        
        addConstraintsWithFormat("H:|[v0]|", views: bgImage)
        addConstraintsWithFormat("H:|[v0]|", views: titleLabel)
        addConstraintsWithFormat("H:|[v0]|", views: descLabel)
        
        addConstraintsWithFormat("V:|[v0]", views: bgImage)
        addConstraint(NSLayoutConstraint(item: bgImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: bgImage, attribute: .bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: descLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 10))
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        //descLabel.prefer
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return layoutAttributes
    }
    
    
    
        
    
    
    
}
