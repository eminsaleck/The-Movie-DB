//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UI
import WebKit

final class AuthPermissionView: UIView {
    
    private let viewModel: AuthPermissionViewModelProtocol
    
    let webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        return webView
    }()
    
    init(frame: CGRect = .zero, viewModel: AuthPermissionViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        addSubview(webView)
        setupWebView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupWebView() {
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        webView.frame = bounds
    }
    
    func loadURL() {
        let request = URLRequest(url: viewModel.authPermissionURL)
        webView.load(request)
    }

}

extension AuthPermissionView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        if let response = navigationResponse.response as? HTTPURLResponse,
           let headers = response.allHeaderFields as? [String: Any],
           (headers["authentication-callback"] as? String) != nil {
            viewModel.signIn()
        }
        decisionHandler(.allow)
    }
}
