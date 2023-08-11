//
//  ViewController.swift
//  Learning-WkWebView
//
//  Created by Tiến Việt Trịnh on 07/08/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    
    //MARK: - UIComponent
    var webView: WKWebView!
    
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .red
        
        let contentController = WKUserContentController()
        contentController.add(self, name: "derp")
        let configure = WKWebViewConfiguration()
        configure.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: configure)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leftAnchor.constraint(equalTo: view.leftAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let url = URL(string: "https://www.youtube.com/watch?v=_pKw8R1auZk&list=RD_pKw8R1auZk&start_radio=1")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    
}

//MARK: - Method
extension ViewController: WKNavigationDelegate, WKScriptMessageHandler {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = """
            window.webkit.messageHandlers.derp.postMessage({ "src": "siuuuuu" });
        """

        webView.evaluateJavaScript(js)
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard let body = message.body as? [String: Any] else {
            print("DEBUG: 0.0.0.0.0.0 could not convert message body to dictionary: \(message.body)")
            return
        }
        
        guard let urlString = body["src"] as? String else {
            print("DEBUG: failed")
            return
        }
        let url = URL(string: urlString)
        print("DEBUG: \(String(describing: url)) siuuu")
    }
}
