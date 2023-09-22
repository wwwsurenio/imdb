//
//  AuthWKWebViewController.swift
//  imdb
//
//  Created by User01 on 9/8/23.
//

import Foundation
import WebKit
import UIKit

protocol AuthWKWebViewControllerDelegate: AnyObject {
    func authenticationDidSucceed(header: String)
}


class AuthWKWebViewController: UIViewController, WKNavigationDelegate {
    weak var delegate: AuthWKWebViewControllerDelegate?
    var webView: WKWebView!
    var initialURL: URL?
    
    init(url: URL) {
        self.initialURL = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = initialURL {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    // WKNavigationDelegate method to handle navigation events
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // Check if the response is an HTTP response
        guard let httpResponse = navigationResponse.response as? HTTPURLResponse else {
            decisionHandler(.allow)
            return
        }
        
        // Check if the header "Authentication-Callback" exists
        if let authCallbackValue = httpResponse.allHeaderFields["authentication-callback"] as? String {
            // Process the authCallbackValue as needed
            print("Authentication-Callback value: \(authCallbackValue)")
            
            // Notify the delegate of successful authentication
            delegate?.authenticationDidSucceed(header: authCallbackValue)
            
            // Close the WKWebView after successful login
            self.navigationController?.popViewController(animated: true)
        }
        
        decisionHandler(.allow)
    }
    
    
}
