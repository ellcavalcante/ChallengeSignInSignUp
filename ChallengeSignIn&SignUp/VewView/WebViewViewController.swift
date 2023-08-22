//
//  WebViewViewController.swift
//  ChallengeSignIn&SignUp
//
//  Created by Ellington Cavalcante on 18/08/23.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        DispatchQueue.main.async {
            guard let url = URL(string: "https://devpoli.com") else { return }
            self.webView.load(URLRequest(url: url))
        }
    }
}

