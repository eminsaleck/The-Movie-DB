//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import Combine
import UI

class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModelProtocol
    private var loginView: LoginView?
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        loginView = LoginView(viewModel: viewModel)
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }
    
    private func subscribe() {
        viewModel
            .viewState
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] state in
                self?.setupView(with: state)
            })
            .store(in: &disposeBag)
    }
    
    private func setupView(with state: LoginViewState) {
        guard let loginView = loginView else { return }
        switch state {
        case .initial:
            loginView.stopLoading()
        case .loading:
            loginView.startLoading()
        case .error:
            loginView.stopLoading()
        }
    }
}
