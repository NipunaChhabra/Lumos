//
//  PracticeVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/25/21.
//

import UIKit

class PracticeVC: UIViewController {
    
    //var user =  User!
    
    lazy var titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 10, height: view.frame.height))
        //label.text = "TechnicalProphet"
        let string = NSMutableAttributedString(string: "Practice.")
        string.setColorForText("Practice", with: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        string.setColorForText(".", with: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
        label.attributedText = string
        //label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "OpenSans-ExtraBold", size: 22)
        label.textAlignment = NSTextAlignment.left
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        navigationItem.titleView = titleLabel
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.06666666667, green: 0.1529411765, blue: 0.2078431373, alpha: 1)
        
        
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let rightBarButtonItem = UIBarButtonItem()
       rightBarButtonItem.customView = btn
        self.navigationItem.rightBarButtonItem = rightBarButtonItem

    }

}
