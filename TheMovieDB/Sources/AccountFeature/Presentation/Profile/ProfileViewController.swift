//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import UI

class ProfileViewController: UIViewController {
    
    private var viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    private func showSignOutActionSheet() {
        let signOutAction = UIAlertAction(title: Localized.accountAlertLogout.localized(),
                                          style: .destructive) { _ in
            self.delegate?.ProfileViewModel(true)
        }
        showSimpleActionSheet(title: Localized.accountAlertLogout.localized(),
                              message: nil, action: signOutAction)
    }
}
