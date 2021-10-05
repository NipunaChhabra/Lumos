//
//  DeveloperCell.swift
//  lumos
//
//  Created by nipuna on 10/5/21.
//

import UIKit

class DeveloperCell: UICollectionViewCell {
    
    var gitLink:String!
    var linkeinLink:String!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    lazy var bgImage : UIImageView = {
    let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 60
        
        return imageView
    }()
    
    lazy var NameLabel : UILabel = {
       let label = UILabel()
        label.text = "title"
        label.textColor = UIColor(named: "text")
        label.font = UIFont(name: "Montserrat-Bold", size: 20)
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
          label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var posLabel : UILabel = {
       let label = UILabel()
        label.text = "name"
        label.textColor = UIColor(named: "text")
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.clipsToBounds = true
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var LinkedInIcon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor(named: "text")
        btn.setImage(UIImage(named: "LinkedinIcon"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 1)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(LinkedinTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var GitIcon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor(named: "text")
        btn.setImage(UIImage(named: "gitIcon"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 1)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(GitTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    func setupLayout(){
        addSubview(bgImage)
        addSubview(NameLabel)
        addSubview(posLabel)
        addSubview(LinkedInIcon)
        addSubview(GitIcon)
        
        addConstraintsWithFormat("H:|-5-[v0(120)]-10-[v1]-5-|", views: bgImage, NameLabel)

        addConstraintsWithFormat("V:|-3-[v0]-2-|", views: bgImage)
        addConstraintsWithFormat("V:|-20-[v0]-2-[v1]-10-[v2(20)]-20-|", views: NameLabel,posLabel,LinkedInIcon)



        addConstraint(NSLayoutConstraint(item: posLabel, attribute: .left, relatedBy: .equal, toItem: NameLabel, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: LinkedInIcon, attribute: .left, relatedBy: .equal, toItem: posLabel, attribute: .left, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: GitIcon, attribute: .top, relatedBy: .equal, toItem: LinkedInIcon, attribute: .top, multiplier: 1, constant: 1))
        addConstraint(NSLayoutConstraint(item: GitIcon, attribute: .bottom, relatedBy: .equal, toItem: LinkedInIcon, attribute: .bottom, multiplier: 1, constant: 1))
        

        
        addConstraintsWithFormat("H:[v0(20)]-5-[v1(20)]", views: LinkedInIcon, GitIcon)
        
    }
    
    @objc func LinkedinTap(_ sender: UIView){
            UIApplication.shared.openURL(NSURL(string: linkeinLink)! as URL)
    }
    
    @objc func GitTap(_ sender: UIView){
            UIApplication.shared.openURL(NSURL(string: gitLink)! as URL)
    }
    
}
