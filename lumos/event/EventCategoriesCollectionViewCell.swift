//
//  EventCategoriesCollectionViewCell.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

import UIKit

class EventCategoriesCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.contentView.layer.cornerRadius = 10.0
        //setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
