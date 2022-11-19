//
//  AuthenticationManager.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases

final class AuthenticationManager: AuthenticationManagerProtocol {

    static let shared = AuthenticationManager()

    var readAccessToken: String {
        return NetworkConfiguration.shared.readAccessToken
    }

    @KeychainStorage(key: Constants.sessionIdKey)
    private var sessionId: String?

    @KeychainStorage(key: Constants.currentUserIdKey )
    private var currentUserId: String?

    @KeychainStorage(key: Constants.accountIdKey)
    private var accountId: String?

    @KeychainStorage(key: Constants.accessTokenKey)
    private var token: String?

    @KeychainStorage(key: Constants.requestTokenKey)
    var requestToken: String?


    private init() {}

    func saveCurrentUser(_ sessionId: String, accountId: Int) {
        self.sessionId = sessionId
        self.currentUserId = String(accountId)
    }

    func deleteCurrentUser() {
        sessionId = nil
        currentUserId = nil
        token = nil
    }

    func saveRequestToken(_ requestToken: String) {
        self.requestToken = requestToken
    }

    func saveAccessToken(_ accessToken: AccessToken) {
        token = accessToken.token
        accountId = accessToken.accountId
    }

    var accessToken: AccessToken? {
        guard let token = token, let accountId = accountId else {
            return nil
        }
        return AccessToken(token: token, accountId: accountId)
    }

    var userAccount: Account? {
        guard let sessionId = sessionId,
            let currentUserId = currentUserId,
            let accountId = Int(currentUserId) else {
                return nil
        }
        return Account(accountId: accountId, sessionId: sessionId)
    }

}

// MARK: - Constants

extension AuthenticationManager {

    struct Constants {
        static let accessTokenKey = "UpcomingMoviesAccessToken"
        static let requestTokenKey = "UpcomingMoviesRequestToken"
        static let accountIdKey = "UpcomingMoviesAccessAccountId"
        static let sessionIdKey = "UpcomingMoviesSessionId"
        static let currentUserIdKey = "UpcomingMoviesUserId"
    }

}
