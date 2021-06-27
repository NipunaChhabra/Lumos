//
//  BlogCell.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/26/21.
//

import UIKit


class BlogCell: UICollectionViewCell {
    
    var blog:Blog?{
        didSet {
            if let title = blog?.title {
                titleLabel.text = title
            }
            if let name = blog?.author{
                nameLabel.text = name
            }
            if let time = blog?.timeToRead{
                timeLabel.text = String(time) + "mins"
            }
            if let rl = blog?.imageurl{
                let freedSpaceString = rl.filter {!$0.isWhitespace}
                bgImage.load(url:URL(string: "https://blog.istemanipal.com/mobile/\(freedSpaceString)")!)
            }
    }
        //something.reloadData
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.contentView.layer.cornerRadius = 10.0
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var elipseButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        btn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 20)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(onElipTapped(_ :)), for: .touchUpInside)
        return btn
    }()
    
    lazy var bgImage : UIImageView = {
    let imageView = UIImageView()
        imageView.image = UIImage(named: "lumos")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.text = "title"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 16)
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
          label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel : UILabel = {
       let label = UILabel()
        label.text = "name"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    lazy var timeLabel : UILabel = {
        let label = UILabel()
        label.text = "2:30"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 14)
        label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var separatorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//        view.translatesAutoresizingMaskIntoConstraints
//        return view
//    }()
    
    func setupLayout(){
        
        addSubview(elipseButton)
        addSubview(bgImage)
        addSubview(titleLabel)
        addSubview(nameLabel)
        addSubview(timeLabel)
        
        addConstraintsWithFormat("H:[v0(50)]|", views: elipseButton)
        addConstraintsWithFormat("V:|[v0(15)]", views: elipseButton)
       
        addConstraintsWithFormat("H:|-15-[v0(110)]-15-[v1]-18-|", views: bgImage, titleLabel)
        
        addConstraintsWithFormat("V:|-20-[v0]-20-|", views: bgImage)
        addConstraintsWithFormat("V:|-20-[v0]", views: titleLabel)
        
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 2))
        addConstraint(NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 2))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: timeLabel, attribute: .left, relatedBy: .equal, toItem: titleLabel, attribute: .left, multiplier: 1, constant: 0))
        }
    
    let blogMoreLauncher = BlogMoreLauncher()
    
    @objc func onElipTapped(_ sender: UIButton){
        blogMoreLauncher.showDim()
        if let title = blog?.title {
            blogMoreLauncher.titleLabel.text = title
        }
        
    }
    
}


