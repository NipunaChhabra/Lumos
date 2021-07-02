//
//  BlogMoreLauncher.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

import Foundation
import UIKit

class BlogMoreLauncher: UIViewController{
    
    var id = ""
    
    var blog:Blog?{
        didSet{
            if let title = blog?.title {
                titleLabel.text = title
            }
            if let ID = blog?._id{
            self.id = ID
            }
        }
    }
    
    lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.text = "title"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 15)
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = true
        return label
    }()
    
    lazy var shareicon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
        btn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleShare(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var bookmarkicon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
        btn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleDismiss(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var abouticon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
        btn.setImage(UIImage(systemName: "info.circle.fill"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
       btn.addTarget(self, action: #selector(handleDismiss(_:)), for: .touchUpInside)
        return btn
    }()
    
    let dimView = UIView()
    
    let Menu: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    func showDim(){
        //print(1223)
        if let window = UIApplication.shared.keyWindow {
            dimView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            dimView.alpha = 0.25
            window.addSubview(dimView)
            window.addSubview(Menu)
            
            let height = CGFloat(150.0)
            let y = window.frame.height - height
            
            Menu.frame = CGRect(x: 0, y: y, width: window.frame.width, height: height)
            Menu.alpha = 1
            
            Menu.addSubview(titleLabel)
            Menu.addSubview(shareicon)
            Menu.addSubview(bookmarkicon)
            Menu.addSubview(abouticon)
            
            
            Menu.addConstraintsWithFormat("V:|[v0]", views: titleLabel)
            Menu.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 45))
            Menu.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: window.frame.width-10))

            Menu.addConstraintsWithFormat("H:|-50-[v0]", views: shareicon)
            Menu.addConstraint(NSLayoutConstraint(item: shareicon, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 2))
            Menu.addConstraint(NSLayoutConstraint(item: shareicon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
            Menu.addConstraint(NSLayoutConstraint(item: shareicon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
            
//            Menu.addConstraint(NSLayoutConstraint(item: bookmarkicon, attribute: .left, relatedBy: .equal, toItem: shareicon, attribute: .right, multiplier: 1, constant: 10))
            Menu.addConstraintsWithFormat("H:|-160-[v0]", views: bookmarkicon)
            Menu.addConstraint(NSLayoutConstraint(item: bookmarkicon, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 5))
            Menu.addConstraint(NSLayoutConstraint(item: bookmarkicon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
            Menu.addConstraint(NSLayoutConstraint(item: bookmarkicon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
            
//            Menu.addConstraint(NSLayoutConstraint(item: abouticon, attribute: .left, relatedBy: .equal, toItem: bookmarkicon, attribute: .right, multiplier: 1, constant: 10))
            Menu.addConstraintsWithFormat("H:|-270-[v0]", views: abouticon)
            Menu.addConstraint(NSLayoutConstraint(item: abouticon, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 5))
            Menu.addConstraint(NSLayoutConstraint(item: abouticon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
            Menu.addConstraint(NSLayoutConstraint(item: abouticon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
            
            dimView.frame = window.frame
            dimView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss(_ :))))
        }
    }
    
    @objc func handleDismiss(_ sender: UIView){
        self.dimView.alpha = 0
        self.Menu.alpha = 0
        
    }
    
    @objc func handleShare(_ sender: UIView){
        let activityVC = UIActivityViewController(activityItems: ["https://blog.istemanipal.com/articles/single//\(id)"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = sender
        self.present(activityVC,animated:true,completion:nil)
    }
    

}
