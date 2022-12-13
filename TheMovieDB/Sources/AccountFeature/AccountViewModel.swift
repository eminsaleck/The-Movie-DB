//
//  AccountViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain
import Shared

final class AccountViewModel: AccountViewModelProtocol {

    private let interactor: AccountInteractorProtocol

    var showAuthPermission: Bindable<URL?> = Bindable(nil)
    var didSignIn: (() -> Void)?
    var didReceiveError: (() -> Void)?

    // MARK: - Initializers

    init(interactor: AccountInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - AccountViewModelProtocol

    func startAuthorizationProcess() {
        interactor.getAuthPermissionURL { result in
            switch result {
            case .success(let url):
                self.showAuthPermission.value = url
            case .failure:
                self.didReceiveError?()
            }
        }
    }

    func signInUser() {
        interactor.signInUser { result in
            switch result {
            case .success:
                self.didSignIn?()
            case .failure:
                self.didReceiveError?()
            }
        }
    }

    func signOutCurrentUser() {
        interactor.signOutUser()
    }

    func isUserSignedIn() -> Bool {
        return currentUser() != nil
    }

    func currentUser() -> User? {
        return interactor.currentUser()
    }

}
