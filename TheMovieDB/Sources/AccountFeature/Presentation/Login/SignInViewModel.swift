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


class SignInViewModel: SignInViewModelProtocol {

    
    private let createTokenUseCase: CreateTokenUseCase
    private let tapButton = PassthroughSubject<Void, Never>()
    
    let viewState: CurrentValueSubject<SignInViewState, Never> = .init(.initial)
    weak var delegate: SignInViewModelDelegate?

    private let scheduler: AnySchedulerOf<DispatchQueue>
    private var disposeBag = Set<AnyCancellable>()
    
    init(createTokenUseCase: CreateTokenUseCase, scheduler: AnySchedulerOf<DispatchQueue> = .main) {
      self.createTokenUseCase = createTokenUseCase
      self.scheduler = scheduler
      subscribe()
    }
    
    func signInDidTapped() {
        tapButton.send(())
    }
    
    func changeState(with state: SignInViewState) {
        viewState.send(state)
    }
    
    private func subscribe() {
      tapButton
        .flatMap { [viewState, createTokenUseCase] () -> AnyPublisher<URL, DataTransferError> in
          viewState.send(.loading)
          return createTokenUseCase.execute()
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
          guard let strongSelf = self else { return }
          strongSelf.delegate?.signInViewModel(strongSelf, didTapSignInButton: url)
        })
        .store(in: &disposeBag)
    }
}
