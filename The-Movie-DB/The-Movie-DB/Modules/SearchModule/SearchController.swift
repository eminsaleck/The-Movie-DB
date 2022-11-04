//
//  SteadyViewController.swift
//  TabBarController+Coordinator
//
//  Created by Vitalii Zaitcev on 6/18/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit

final class SearchController: UIViewController {

    var didSendEventClosure: ((SearchController.Event) -> Void)?

    private let searchButton: UIButton = {
        $0.setTitle("Search", for: .normal)
        $0.backgroundColor = .systemYellow
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8.0
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(searchButton)

        searchButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchButton.widthAnchor.constraint(equalToConstant: 200),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        searchButton.addTarget(self, action: #selector(didTapSearchButton(_:)), for: .touchUpInside)
    }
    
    deinit {
        print("SteadyViewController deinit")
    }

    @objc private func didTapSearchButton(_ sender: Any) {
        didSendEventClosure?(.search)
    }
}

extension SearchController {
    enum Event {
        case search
    }
}
