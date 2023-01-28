//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation
import Combine
import CombineSchedulers
import Network


class LoginViewModel: LoginViewModelProtocol {

    private let interactor: LoginInteractorProtocol
    private let tapButton = PassthroughSubject<Void, Never>()
    
    let viewState: CurrentValueSubject<SignInViewState, Never> = .init(.initial)
    weak var delegate: LoginViewModelDelegate?

    private let scheduler: AnySchedulerOf<DispatchQueue>
    private var disposeBag = Set<AnyCancellable>()
    
    init(interactor: LoginInteractorProtocol, scheduler: AnySchedulerOf<DispatchQueue> = .main) {
      self.interactor = interactor
      self.scheduler = scheduler
      subscribe()
    }
    
    func loginDidTapped() {
        tapButton.send(())
    }
    
    func changeState(with state: SignInViewState) {
        viewState.send(state)
    }
    
    private func subscribe() {
      tapButton
        .flatMap { [viewState, interactor] () -> AnyPublisher<URL, DataTransferError> in
          viewState.send(.loading)
          return interactor.execute()
        }
        .receive(on: scheduler)
        .sink(receiveCompletion: { [weak self] completion in
          switch completion {
          case let .failure(error):
            print("error to request token: \(error)")
            self?.viewState.send(.loading)
          case .finished:
            break
          }
        },
              receiveValue: { [weak self] url in
            self?.delegate?.loginViewModel(self!, didTapLoginButton: url)
        })
        .store(in: &disposeBag)
    }
}
