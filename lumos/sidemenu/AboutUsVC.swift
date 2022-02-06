//
//  AboutUsVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/26/21.
//

import UIKit

class AboutUsVC: UIViewController {
    
    lazy var bgImage : UIImageView = {
    let imageView = UIImageView()
        imageView.image = UIImage(named: "lumos")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        return imageView
    }()

    lazy var descLabel : UILabel = {
       let label = UILabel()
        label.text = """
Emanating from the roots of technology, ISTE Students' Chapter Manipal constitutes a group of motivated people constantly propelling each other for collective progress, solidifying milestones on the way.
        From hosting Tech Tatva's ace event Acumen, organising coding sprints like Enigma, or connecting the student community with industry experts, we are committed to delivering the best. Interview experiences act as a cherry on top, providing direction and strategy to countless fresh talents.
        Workshops round the year offer hands-on experience to curious geeks, while AI Sundays and Science in Storytelling take you back to the holy grail of technology, shaping our social media's core.
        While you're here, we'll surely leave a positive impact on your day, with our technical exhibit.
"""
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont(name: "Montserrat-Medium", size: 16)
        label.clipsToBounds = true
        label.numberOfLines = 30
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var FbIcon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor(named: "text")
        btn.setImage(UIImage(named: "fbIcon"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(FBTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var InstaIcon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor(named: "text")
        btn.setImage(UIImage(named: "igIcon"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(IGTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var WebIcon: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor(named: "text")
        btn.setImage(UIImage(named: "webIcon"), for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 50)
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(WebTap(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(bgImage)
        view.addSubview(descLabel)
        view.addSubview(FbIcon)
        view.addSubview(InstaIcon)
        view.addSubview(WebIcon)
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: "Accent")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "Accent")]
        
        _ = bgImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom:nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 100)
        _ = descLabel.anchor(top: bgImage.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 10, leftConstant: 8, bottomConstant: 80, rightConstant: 8)
            let centerX = descLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            NSLayoutConstraint.activate([centerX])
            let centerXIm = bgImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            NSLayoutConstraint.activate([centerXIm])
        
        _ = WebIcon.anchor(top: nil, left:nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 0)
        
        let centerWeb = WebIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        NSLayoutConstraint.activate([centerWeb])
 

        _ = FbIcon.anchor(top: nil, left: WebIcon.rightAnchor, bottom: WebIcon.bottomAnchor, right: nil, topConstant: 0, leftConstant: 45, bottomConstant: 0, rightConstant: 0)


        _ = InstaIcon.anchor(top: nil, left: nil, bottom: WebIcon.bottomAnchor, right: WebIcon.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 45)

        // Do any additional setup after loading the view.
    }
    
    @objc func IGTap(_ sender: UIView){
            UIApplication.shared.openURL(NSURL(string: "https://www.instagram.com/istemanipal/")! as URL)
    }
    
    @objc func FBTap(_ sender: UIView){
            UIApplication.shared.openURL(NSURL(string: "https://m.facebook.com/istemanipal")! as URL)
    }
    
    @objc func WebTap(_ sender: UIView){
            UIApplication.shared.openURL(NSURL(string: "https://istemanipal.com/")! as URL)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
