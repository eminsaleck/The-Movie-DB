//
//  AuthPermissionWebViewNavigation.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.11.2022.
//

import Foundation
import WebKit

class AuthPermissionWebViewNavigation: NSObject, AuthPermissionWebViewNavigationDelegate {

    var didFinishNavigation: () -> Void


    init(didFinishNavigation: @escaping () -> Void) {
        self.didFinishNavigation = didFinishNavigation
    }


    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinishNavigation()
    }

}
