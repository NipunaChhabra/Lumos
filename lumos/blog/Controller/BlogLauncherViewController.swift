//
//  BlogLauncher.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/27/21.
//

import Foundation
import UIKit
import WebKit
class BlogLauncherViewController: UIViewController, WKUIDelegate {
    
    var activityIndicator = UIActivityIndicatorView(style: .medium)

    var blog:Blog?{
        didSet{
            if let _id = blog?._id {
                self.id = _id
            }
        }
        //reloadSomething
    }
    
    var id = ""
    var webView: WKWebView!
    
    lazy var bgImage : UIImageView = {
    let imageView = UIImageView()
        imageView.image = UIImage(named: "lumos")

        imageView.contentMode = .bottom
        imageView.clipsToBounds = true
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        view.addSubview(bgImage)
        bgImage.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.isHidden = true
        let myURL = URL(string:"https://blog.istemanipal.com/articles/single//\(id)/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isUserInteractionEnabled = true
        bgImage.alpha = 0
    }
}
