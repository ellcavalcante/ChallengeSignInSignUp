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
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://devpoli.com") else { return }
        self.webView.load(URLRequest(url: url))
    }
}
