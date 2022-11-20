//
//  AuthPermissionViewController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.11.2022.
//


import UIKit
import WebKit

protocol AuthPermissionViewControllerDelegate: AnyObject {
    
    func authPermissionViewController(_ authPermissionViewController: AuthPermissionViewController,
                                      didReceiveAuthorization authorized: Bool)
    
}

class AuthPermissionViewController: UIViewController {
    
    private var webView: WKWebView?
    private weak var backButton: UIBarButtonItem!
    private weak var forwardButton: UIBarButtonItem!
    
    
    private var estimatedProgressObserver: NSKeyValueObservation!
    private var webViewNavigationDelegate: AuthPermissionWebViewNavigationDelegate!
    
    var viewModel: AuthPermissionViewModelProtocol?
    weak var coordinator: AuthPermissionCoordinatorProtocol?
    weak var delegate: AuthPermissionViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupNavigationBar()
        setupWebView()
    }
    
    private func setupNavigationBar() {
        navigationController?.presentationController?.delegate = self
        
        let closeBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop,
                                                 target: self, action: #selector(closeBarButtonAction))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    private func setupWebView() {
        webView = WKWebView(frame: view.bounds)

        let didFinishNavigation = { [unowned self] in
            self.checkNavigationButtonsState()
        }
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem = forwardButton
        webViewNavigationDelegate = AuthPermissionWebViewNavigation(didFinishNavigation: didFinishNavigation)
        webView!.navigationDelegate = webViewNavigationDelegate
        webView!.allowsBackForwardNavigationGestures = true
    }
    
    private func setupBindables() {
        loadURL()
    }
    
    private func loadURL() {
        guard let urlRequest = viewModel?.authPermissionURLRequest else { return }
        webView!.load(urlRequest)
    }
    
    private func dismiss() {
        coordinator?.dismiss(completion: {
            self.delegate?.authPermissionViewController(self, didReceiveAuthorization: true)
        })
    }
    
    private func checkNavigationButtonsState() {
        backButton.isEnabled = webView!.canGoBack
        forwardButton.isEnabled = webView!.canGoForward
    }
    
    
    @objc func closeBarButtonAction() {
        dismiss()
    }
    
    
}

// MARK: - UIAdaptivePresentationControllerDelegate

extension AuthPermissionViewController: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        coordinator?.didDismiss()
        delegate?.authPermissionViewController(self, didReceiveAuthorization: true)
    }
    
}
