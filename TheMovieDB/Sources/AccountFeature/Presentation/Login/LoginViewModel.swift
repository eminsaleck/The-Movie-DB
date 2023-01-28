//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation
import Combine
import Network

enum LoginViewState: Equatable {
  case initial
  case loading
  case error
}

protocol LoginViewModelProtocol {
  func loginDidTapped()
  func changeState(with state: LoginViewState)
  var viewState: CurrentValueSubject<LoginViewState, Never> { get }
  var delegate: LoginViewModelDelegate? { get set }
}

protocol LoginViewModelDelegate: AnyObject {
  func loginViewModelDelegate(_ url: URL)
}

class LoginViewModel: LoginViewModelProtocol {

    private let interactor: LoginInteractorProtocol
    private let tapButton = PassthroughSubject<Void, Never>()
    
    let viewState: CurrentValueSubject<LoginViewState, Never> = .init(.initial)
    weak var delegate: LoginViewModelDelegate?

    private var bag = Set<AnyCancellable>()
    
    init(interactor: LoginInteractorProtocol) {
      self.interactor = interactor
      subscribe()
    }
    
    func loginDidTapped() {
        tapButton.send(())
    }
    
    func changeState(with state: LoginViewState) {
        viewState.send(state)
    }
    
    private func subscribe() {
      tapButton
        .flatMap { [viewState, interactor]
            () -> AnyPublisher<URL, DataTransferError> in
          viewState.send(.loading)
          return interactor.execute()
        }
        .receive(on: DispatchQueue.main)
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
            self?.delegate?.loginViewModelDelegate(url)
        })
        .store(in: &bag)
    }
}
