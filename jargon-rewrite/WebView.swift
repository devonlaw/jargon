//
//  WebView.swift
//  jargon-rewrite
//
//  Created by Devon Law on 2019-07-18.
//  Copyright © 2019 Slackers. All rights reserved.
//

import WebKit
import UIKit


class WebView: UIViewController, WKNavigationDelegate, WKUIDelegate {
    @IBOutlet var webView: WKWebView!
    //var content  = String()
    var tempUrl: URL?
    let urlMy = URL(string: "https://www.google.ca")
    //let htmlURL = Bundle.main.url(forResource: "webby", withExtension: "html")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let req = URLRequest(url: urlMy!)
        //webView.loadHTMLString("<html><body><p>Hello!</p></body></html>", baseURL: htmlURL!)
        webView.load(req)
        //webView?.navigationDelegate = self
        //webView?.uiDelegate = self
        //webView!.loadFileURL(htmlURL!, allowingReadAccessTo: htmlURL!)
        //self.view.addSubview(webView)
    }
    
    
}
