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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        let myURL = URL(string:"https://blog.istemanipal.com/articles/single//\(id)/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isUserInteractionEnabled = true
//        webView.addConstraintsWithFormat("H:|[v0]|", views: webView)
    }
}
