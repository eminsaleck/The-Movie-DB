//
//  ProfileController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 02.11.2022.
//

import UIKit

class ProfileController: UIViewController {

    var didSendEventClosure: ((ProfileController.Event) -> Void)?

    private let logout: UIButton = {
        let button = UIButton()
        button.setTitle("logout", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(logout)

        logout.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logout.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logout.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logout.widthAnchor.constraint(equalToConstant: 200),
            logout.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        logout.addTarget(self, action: #selector(didTapGoButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("GoViewController deinit")
    }
    
    @objc private func didTapGoButton(_ sender: Any) {
        didSendEventClosure?(.profile)
    }
}

extension ProfileController {
    enum Event {
        case profile
    }
}
