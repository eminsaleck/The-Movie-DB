//
//  ProfileController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 02.11.2022.
//


import UIKit

final class ProfileController: UIViewController {

    var didSendEventClosure: ((ProfileController.Event) -> Void)?

    private let logout: UIButton = {
        $0.setTitle("logout", for: .normal)
        $0.backgroundColor = .systemGreen
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8.0
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
