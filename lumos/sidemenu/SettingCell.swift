//
//  SettingCell.swift
//  youtube
//
//  Created by Brian Voong on 6/18/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class SettingCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
            
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            
        }
    }
    
    var setting: Setting? {
        didSet {
            nameLabel.text = setting?.name

            }
        }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor(named: "text")
        return label
    }()
    

    
    func setupViews() {
        addSubview(nameLabel)
        addConstraintsWithFormat("H:|-10-[v0]-10-|", views: nameLabel)
        addConstraintsWithFormat("V:|[v0]|", views: nameLabel)
    }
}






