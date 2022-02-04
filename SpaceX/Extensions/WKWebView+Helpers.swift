//
//  WKWebView+Helpers.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/4/22.
//

import WebKit

extension WKWebView {
    
    func load(urlString: String, isScrollable: Bool) {
        guard let url = URL(string: urlString) else { return }
        load(URLRequest(url: url))
        allowsBackForwardNavigationGestures = true
        scrollView.isScrollEnabled = isScrollable
    }
}
