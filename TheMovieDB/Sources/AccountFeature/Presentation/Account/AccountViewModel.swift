//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Foundation
import Combine
import CombineSchedulers
import Network
import Common

enum AccountViewState: Equatable {
    case login
    case profile(account: Account)
}

protocol AccountViewModelProtocol {
    func viewDidLoad()
    var viewState: CurrentValueSubject<AccountViewState, Never> { get }
}

final class AccountViewModel: AccountViewModelProtocol {
    private let interactor: AccountInteractorProtocol
    
    weak var coordinator: AccountCoordinatorProtocol?
    private var disposeBag = Set<AnyCancellable>()
    private let scheduler: AnySchedulerOf<DispatchQueue>
    
    // MARK: - Public Api
    let viewState: CurrentValueSubject<AccountViewState, Never> = .init(.login)
    
    // MARK: - Initializers
    init(interactor: AccountInteractorProtocol, scheduler: AnySchedulerOf<DispatchQueue> = .main) {
        self.interactor = interactor
        self.scheduler = scheduler
    }
    
    func viewDidLoad() {
        checkIsLogged()
    }
    
    private func checkIsLogged() {
        if interactor.currentUserID() != nil {
            fetchUserDetails()
        } else {
            viewState.send(.login)
        }
    }
    
    private func fetchUserDetails() {
        fetchDetailsAccount()
            .receive(on: scheduler)
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
            .store(in: &disposeBag)
    }
    
    private func createSession() {
        interactor.createSession()
            .flatMap { [weak self] () -> AnyPublisher<Account, DataTransferError> in
                guard let self = self else {
                    return Fail(error: DataTransferError.noResponse).eraseToAnyPublisher()
                }
                return self.fetchDetailsAccount()
            }
            .receive(on: scheduler)
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
            .store(in: &disposeBag)
    }
    
    private func fetchDetailsAccount() -> AnyPublisher<Account, DataTransferError> {
        return interactor.getDetails()
    }
    
    private func logoutUser() {
        interactor.deleteUser()
        viewState.send(.login)
    }
    
    // MARK: - Navigation
    private func navigateTo(state: AccountState) {
        coordinator?.navigate(with: state)
    }
}
