//
//  ThemeVC.swift
//  lumos
//
//  Created by nipuna on 10/5/21.
//

import UIKit

class ThemeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    let dimView = UIView()
    
    let Menu: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(named: "background")
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
            
            dimView.frame = window.frame
            dimView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss(_ :))))
        }
    }

    @objc func handleDismiss(_ sender: UIView){
        self.dimView.alpha = 0
        self.Menu.alpha = 0
        
    }

}
