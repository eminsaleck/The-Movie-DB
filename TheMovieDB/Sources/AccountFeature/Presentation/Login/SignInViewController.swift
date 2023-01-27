//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import Combine
import UI

class SignInViewController: UIViewController {
    
    private let viewModel: SignInViewModelProtocol
    private var rootView: SignInView?
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        rootView = SignInView(viewModel: viewModel)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }
    
    fileprivate func subscribe() {
        viewModel
            .viewState
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] state in
                self?.setupView(with: state)
            })
            .store(in: &disposeBag)
    }
    
    fileprivate func setupView(with state: SignInViewState) {
        switch state {
        case .initial:
            rootView?.stopLoading()
        case .loading:
            rootView?.startLoading()
        case .error:
            rootView?.stopLoading()
        }
    }
}
