//
//  AccountViewController.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import UIKit
import Combine
import UI

protocol AccountViewControllerDelegate {
  func makeSignInViewController() -> UIViewController
  func makeProfileViewController(with account: Account) -> UIViewController
}

class AccountViewController: UIViewController {

    private let viewModel: AccountViewModelProtocol
    private let delegate: AccountViewControllerDelegate
    private var currentViewController: UIViewController?
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: AccountViewModelProtocol, delegate: AccountViewControllerDelegate) {
        self.delegate = delegate
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.isLogged()
        subscribe()
    }
    
    override func loadView() {
        view = UIView()
    }
    
    private func subscribe() {
      viewModel
        .viewState
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { _ in },
              receiveValue: { [weak self] viewState in
          self?.setupUI(with: viewState)
        })
        .store(in: &disposeBag)
    }
    
    private func setupUI(with state: AccountViewState) {
      switch state {
      case .login:
        let loginVC = delegate.makeSignInViewController()
        transition(to: loginVC, with: Strings.accountTitleLogin.localized())
      case .profile(let account):
        let profileVC = delegate.makeProfileViewController(with: account)
        transition(to: profileVC, with: Strings.accountTitle.localized())
      }
    }
    
    private func transition(to viewController: UIViewController, with text: String) {
      remove(currentViewController)
      add(viewController)
      title = text
      currentViewController = viewController
    }
    
    private func remove(_ viewController: UIViewController?) {
      guard let viewController = viewController else { return }
      viewController.willMove(toParent: nil)
      viewController.view.removeFromSuperview()
      viewController.removeFromParent()
    }
    
    private func add(_ viewController: UIViewController) {
      addChild(viewController)
      view.addSubview(viewController.view)
      viewController.view.frame = view.bounds
      viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      viewController.didMove(toParent: self)
    }

}
