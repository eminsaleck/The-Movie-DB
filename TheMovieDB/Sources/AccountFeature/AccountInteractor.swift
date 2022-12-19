//
//  AccountInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain
import Handlers

public class AccountInteractor: AccountInteractorProtocol {

    private let userUseCase: UserUseCaseProtocol
    private let authUseCase: AuthUseCaseProtocol
    private let accountUseCase: AccountUseCaseProtocol

    private let authHandler: AuthenticationHandlerProtocol

   public init(useCaseProvider: UseCaseProviderProtocol,
         authHandler: AuthenticationHandlerProtocol) {
        self.userUseCase = useCaseProvider.userUseCase()
        self.accountUseCase = useCaseProvider.accountUseCase()
        self.authUseCase = useCaseProvider.authUseCase()
        self.authHandler = authHandler
    }

    public func getAuthPermissionURL(completion: @escaping (Result<URL, Error>) -> Void) {
        authUseCase.getAuthURL(completion: completion)
    }

    public func signInUser(completion: @escaping (Result<User, Error>) -> Void) {
        authUseCase.signInUser { result in
            switch result {
            case .success(let user):
                self.userUseCase.saveUser(user)
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func signOutUser() {
        authHandler.deleteCurrentUser()
    }

    public func currentUser() -> User? {
        authHandler.currentUser()
    }

}
