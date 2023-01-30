//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import UI

protocol ProfileViewControllerDelegate{
    func didLogoutTapped(_ bool: Bool)
}

class ProfileViewController: UIViewController {
    
    private var viewModel: ProfileViewModelProtocol
    var delegate: ProfileViewControllerDelegate?

    
    init(viewModel: ProfileViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
      view = ProfileView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    
    private func showSignOutActionSheet() {
        let signOutAction = UIAlertAction(title: Localized.accountAlertLogout.localized(),
                                          style: .destructive) {  [weak self] _ in
            self?.delegate?.didLogoutTapped(true)
        }
        showSimpleActionSheet(title: Localized.accountAlertLogout.localized(),
                              message: nil, action: signOutAction)
    }
}
