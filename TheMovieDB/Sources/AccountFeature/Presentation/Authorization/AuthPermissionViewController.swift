//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import UI

class AuthPermissionViewController: UIViewController {
    
    private let viewModel: AuthPermissionViewModelProtocol
    private var rootView: AuthPermissionView?
    
    init(viewModel: AuthPermissionViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        rootView = AuthPermissionView(viewModel: viewModel)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()
    }
    
    deinit {
        print("deinit \(Self.self)")
    }
    
    fileprivate func loadURL() {
        rootView?.loadURL()
    }
}

extension AuthPermissionViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        viewModel.signIn()
    }
}
