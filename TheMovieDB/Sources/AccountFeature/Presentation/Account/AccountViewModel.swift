//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Foundation
import Combine
import Network
import Common

enum AccountViewState: Equatable {
    case login
    case profile(account: Account)
}

protocol AccountViewModelProtocol {
    func isLogged()
    var viewState: CurrentValueSubject<AccountViewState, Never> { get }
}

final class AccountViewModel: AccountViewModelProtocol {
    
    private let interactor: AccountInteractorProtocol
    weak var coordinator: AccountCoordinatorProtocol?
    private var bag = Set<AnyCancellable>()

    let viewState: CurrentValueSubject<AccountViewState, Never> = .init(.login)

    init(interactor: AccountInteractorProtocol) {
        self.interactor = interactor
    }
    
    func isLogged() {
        checkIsLogged()
    }
    
    private func checkIsLogged() {
        if interactor.currentUserID() != nil {
            fetchUserDetails()
        } else {
            viewState.send(.login)
        }
    }
    
    private func fetchDetailsAccount() -> AnyPublisher<Account, DataTransferError> {
        return interactor.getDetails()
    }
    
    private func fetchUserDetails() {
        fetchDetailsAccount()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure:
                    self?.viewState.send(.login)
                case .finished:
                    break
                }
            },
                  receiveValue: { [weak self] accountDetails in
                self?.viewState.send(.profile(account: accountDetails))
            })
            .store(in: &bag)
    }
    
    private func createSession() {
        interactor.createSession()
            .flatMap { [weak self] () -> AnyPublisher<Account, DataTransferError> in
                guard let self = self else {
                    return Fail(error: DataTransferError.noResponse).eraseToAnyPublisher()
                }
                return self.fetchDetailsAccount()
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure:
                    self?.viewState.send(.login)
                case .finished:
                    break
                }
            },
                  receiveValue: { [weak self] accountDetails in
                self?.viewState.send(.profile(account: accountDetails))
            })
            .store(in: &bag)
    }
    
    private func logout() {
        interactor.deleteUser()
        viewState.send(.login)
    }
}

extension AccountViewModel: LoginViewModelDelegate {
  func loginViewModelDelegate(_ url: URL) {
      coordinator?.navigate(with: .loginInIsPicked(url: url, delegate: self))
  }
}

extension AccountViewModel: AuthPermissionViewModelDelegate {
  func authPermissionViewModelDelegate(_ signedIn: Bool) {
    createSession()
      coordinator?.navigate(with: .authorizationIsComplete)
  }
}

extension AccountViewModel: ProfileViewControllerDelegate{
    func didLogoutTapped(_ bool: Bool) {
        logout()
    }
}
