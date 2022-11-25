//
//  ProfileController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 02.11.2022.
//


import UIKit

class AccountViewController: UIViewController {

    private var signInViewController: SignInViewController?
    private var profileViewController: ProfileViewController?

    var viewModel: AccountViewModelProtocol!
    weak var coordinator: AccountCoordinatorProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = view.tintColor
    }

    // MARK: - Private

    private func setupUI() {
        title = LocalizedStrings.accountTabBarTitle()
        setupContainerView()
        setupNavigationBar()
    }

    private func setupContainerView() {
        viewModel.isUserSignedIn() ? showProfileView() : showSignInView()
    }

    private func setupNavigationBar() {
        navigationItem.title = LocalizedStrings.accountTitle()
    }

    private func showSignInView(withAnimatedNavigationBar animated: Bool = false) {
        signInViewController = coordinator?.embedSignInViewController(on: self)
        coordinator?.removeChildViewController(&profileViewController, from: self)
    }

    private func showProfileView(withAnimatedNavigationBar animated: Bool = false) {
        guard let viewModel = viewModel else { return }
        profileViewController = coordinator?.embedProfileViewController(on: self,
                                                                        for: viewModel.currentUser())

        coordinator?.removeChildViewController(&signInViewController, from: self)
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        viewModel.showAuthPermission.bind { [weak self] authPermissionURL in
            guard let self = self else { return }
            self.coordinator?.showAuthPermission(for: authPermissionURL,
                                                       and: self)
        }
        viewModel.didSignIn = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showProfileView(withAnimatedNavigationBar: true)
            }
        }
        viewModel.didReceiveError = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.signInViewController?.stopLoading()
            }
        }
    }

}

// MARK: - SignInViewControllerDelegate

extension AccountViewController: SignInViewControllerDelegate {

    func signInViewController(_ signInViewController: SignInViewController, didTapSignInButton tapped: Bool) {
        signInViewController.startLoading()
        viewModel.startAuthorizationProcess()
    }

}

// MARK: - ProfileViewControllerDelegate

extension AccountViewController: ProfileViewControllerDelegate {

    func profileViewController(didTapProfileOption option: ProfileOptionProtocol) {
        coordinator?.showProfileOption(option)
    }

    func profileViewController(didSignOut signedOut: Bool) {
        viewModel.signOutCurrentUser()
        showSignInView(withAnimatedNavigationBar: true)
    }

}

// MARK: - AuthPermissionViewControllerDelegate

extension AccountViewController: AuthPermissionViewControllerDelegate {

    func authPermissionViewController(_ authPermissionViewController: AuthPermissionViewController,
                                      didReceiveAuthorization authorized: Bool) {
        if authorized { viewModel.signInUser() }
    }

}
