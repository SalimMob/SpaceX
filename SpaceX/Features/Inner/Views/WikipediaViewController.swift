//
//  WikipediaViewController.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/4/22.
//

import UIKit
import WebKit

class WikipediaViewController: UIViewController {

    @IBOutlet weak var wikipediaWebView: WKWebView!
    var wikiURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wikipediaWebView.navigationDelegate = self
        wikipediaWebView.load(urlString: wikiURL, isScrollable: true)
    }
}

extension WikipediaViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
}
