//
//  AccountViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain
import Shared

public final class AccountViewModel: AccountViewModelProtocol {

    private let interactor: AccountInteractorProtocol

    public var showAuthPermission: Bindable<URL?> = Bindable(nil)
    public var didSignIn: (() -> Void)?
    public var didReceiveError: (() -> Void)?

    // MARK: - Initializers

    public init(interactor: AccountInteractorProtocol) {
        self.interactor = interactor
    }

    // MARK: - AccountViewModelProtocol

    public func startAuthorizationProcess() {
        interactor.getAuthPermissionURL { result in
            switch result {
            case .success(let url):
                self.showAuthPermission.value = url
            case .failure:
                self.didReceiveError?()
            }
        }
    }

    public func signInUser() {
        interactor.signInUser { result in
            switch result {
            case .success:
                self.didSignIn?()
            case .failure:
                self.didReceiveError?()
            }
        }
    }

    public func signOutCurrentUser() {
        interactor.signOutUser()
    }

    public func isUserSignedIn() -> Bool {
        return currentUser() != nil
    }

    public func currentUser() -> User? {
        return interactor.currentUser()
    }

}
