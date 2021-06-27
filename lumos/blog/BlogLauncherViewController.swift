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
//        view.addSubview(bgImage)
//        bgImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        showActivityIndicator(show: true)
//        bgImage.isHidden = false
//        bgImage.isOpaque = true
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
       // view.addSubview(bgImage)
       // bgImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: //view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.isHidden = true
        let myURL = URL(string:"https://blog.istemanipal.com/articles/single//\(id)/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isUserInteractionEnabled = true
        webView.addSubview(activityIndicator)
        
        
//        bgImage.isHidden = true
//        bgImage.isOpaque = false
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
//            bgImage.isHidden = false
//            bgImage.isOpaque = true
        } else {
            activityIndicator.stopAnimating()
//            bgImage.isHidden = true
//            bgImage.isOpaque = false
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}

//class BlogLauncher:NSObject{
//
//    func showBlog(){
//        if let keyWindow = UIApplication.shared.keyWindow{
//            let view = UIView(frame: keyWindow.frame)
//            view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
//            keyWindow.addSubview(view)
//
//        }
//    }
//}
