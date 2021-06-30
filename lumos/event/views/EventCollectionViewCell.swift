//
//  EventCollectionViewCell.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/30/21.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    var url = "https://blog.istemanipal.com/"
    
    var event:event?{
        didSet{
            if let title = event?.name {
                titleLabel.text = title
            }
            if let d = event?.description {
                descLabel.text = d
            }
            
            if event?.event_date_set?.count ?? 0 > 0{
                for i in 0...event!.event_date_set!.count-1{
                    if let venue = event?.event_date_set{
                        locLabel.text = locLabel.text! + "\(venue[i].venue!),"
                    }
                    if let isoDate = event?.event_date_set?[i].start_date!{
                        let dateFormatter = DateFormatter()
                        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let date = dateFormatter.date(from:isoDate)!
                        let calendar = Calendar.current
                        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
                        dateLabel.text = dateLabel.text! + "\(components.day!)/\(components.month!),"
                    }
                }
            }
            if let url = event?.registration_link {
                self.url = url
            }
            
        }
    }
    
    lazy var titleLabel : UILabel = {
       let label = UILabel()
        label.text = "title"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Bold", size: 25)
        label.numberOfLines = 3
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
          label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descLabel : UILabel = {
       let label = UILabel()
        label.text = "dhffhkjd kfhasdfkh fkjhfjksd fsjkhaskJFH HFJKFH FKHkjh"
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 15)
        label.clipsToBounds = true
        label.numberOfLines = 22
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var regLabel : UIButton = {
       let label = UIButton()
        label.setTitle("Registration Link", for: .normal)
        //label.configure(color: #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1), font:  UIFont(name: "Montserrat-Medium", size: 16)!,borderWidth: 0)
        label.configure(color: #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1), font: UIFont(name: "Montserrat-Medium", size: 16)!, cornerRadius: 0, borderColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), borderWidth: 0)
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addTarget(self, action: #selector(Button(_ :)), for: .touchUpInside)
        return label
    }()
    
    
    lazy var locationIcon : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "location.north.fill"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 18)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.tintColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
        return btn
    }()
    
    lazy var locLabel : UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 15)
        label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var calendarIcon : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "calendar"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 18)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.tintColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
        return btn
    }()
    
    lazy var dateLabel : UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 15)
        label.clipsToBounds = true
        label.textAlignment = NSTextAlignment.left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var regIcon : UIButton = {
        let btn = UIButton(type: .custom)
        var url = ""
        btn.setImage(UIImage(systemName: "link.badge.plus"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 18)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(Button(_ :)), for: .touchUpInside)
        btn.tintColor = #colorLiteral(red: 0.07058823529, green: 0.9215686275, blue: 0.8705882353, alpha: 1)
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(locationIcon)
        addSubview(calendarIcon)
        addSubview(regIcon)
        addSubview(locLabel)
        addSubview(dateLabel)
        addSubview(regLabel)
        
        //horizontal constraints
        addConstraintsWithFormat("H:|-15-[v0]-10-|", views: titleLabel)
        addConstraintsWithFormat("H:|-5-[v0]-5-|", views: descLabel)
        addConstraintsWithFormat("H:|-5-[v0]", views: locationIcon)
        addConstraintsWithFormat("H:|-5-[v0]", views: calendarIcon)
        addConstraintsWithFormat("H:|-5-[v0]", views: regIcon)
        addConstraintsWithFormat("H:|-35-[v0]", views: locLabel)
        addConstraintsWithFormat("H:|-35-[v0]", views: dateLabel)
        addConstraintsWithFormat("H:|-35-[v0]", views: regLabel)
        
        
        //vertical constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 32))
        addConstraint(NSLayoutConstraint(item: descLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 18))
        
        addConstraint(NSLayoutConstraint(item: locationIcon, attribute: .bottom, relatedBy: .equal, toItem: calendarIcon, attribute: .top, multiplier: 1, constant: -5))
        addConstraint(NSLayoutConstraint(item: locLabel, attribute: .bottom, relatedBy: .equal, toItem: calendarIcon, attribute: .top, multiplier: 1, constant: -5))
        addConstraint(NSLayoutConstraint(item: calendarIcon, attribute: .bottom, relatedBy: .equal, toItem: regIcon, attribute: .top, multiplier: 1, constant: -5))
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .bottom, relatedBy: .equal, toItem: regIcon, attribute: .top, multiplier: 1, constant: -5))
        addConstraintsWithFormat("V:[v0]-12-|", views: regIcon)
        addConstraintsWithFormat("V:[v0]-12-|", views: regLabel)
        
        
    }
    
    @IBAction func Button(_ sender: Any) {
        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
     }
    
    
}
