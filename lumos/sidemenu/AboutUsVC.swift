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
        label.numberOfLines = 20
        label.textAlignment = NSTextAlignment.center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(bgImage)
        view.addSubview(descLabel)
        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        _ = bgImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom:nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 120, heightConstant: 120)
        _ = descLabel.anchor(top: bgImage.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 20, leftConstant: 30, bottomConstant: 0, rightConstant: 30)
            let centerX = descLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            NSLayoutConstraint.activate([centerX])
            let centerXIm = bgImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            NSLayoutConstraint.activate([centerXIm])
        // Do any additional setup after loading the view.
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
