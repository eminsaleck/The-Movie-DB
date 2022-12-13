//
//  AuthenticationManager.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Domain

final class AuthenticationHandler: AuthenticationHandlerProtocol {

    private let authUseCase: AuthUseCaseProtocol
    private let userUseCase: UserUseCaseProtocol

    // MARK: - Initializers

    init(authUseCase: AuthUseCaseProtocol, userUseCase: UserUseCaseProtocol) {
        self.authUseCase = authUseCase
        self.userUseCase = userUseCase
    }

    // MARK: - Authentitacion Persistence

    func currentUser() -> User? {
        guard let userId = authUseCase.currentUserId() else { return nil }
        return userUseCase.find(with: userId)
    }

    func isUserSignedIn() -> Bool {
        return currentUser() != nil
    }

    func deleteCurrentUser() {
        authUseCase.signOutUser(completion: { _ in })
    }

}
