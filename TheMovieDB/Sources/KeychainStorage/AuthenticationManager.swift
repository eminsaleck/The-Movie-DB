//
//  AuthenticationManager.swift
//  UpcomingMoviesData
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import Common

public final class AuthenticationManager {
    
    public static let shared = AuthenticationManager()
    
    @KeychainWrapper(key: Constants.sessionIdKey)
    private var sessionId: String?
    
    @KeychainWrapper(key: Constants.accountIdKey)
    private var accountId: String?
    
    @KeychainWrapper(key: Constants.accessTokenKey)
    private var accessToken: String?
    
    @KeychainWrapper(key: Constants.requestTokenKey)
    var requestToken: String?
    
    // MARK: - Initializer
    
    public init() {}
}

extension AuthenticationManager: RequestTokenLocalDataSource {
    public func getRequestToken() -> String? {
        requestToken
    }
    
    public func saveRequestToken(_ token: String) {
        requestToken = token
    }
}

extension AuthenticationManager: AccessTokenLocalDataSource {
    public func saveAccessToken(_ token: String) {
        accessToken = token
    }
    
    public func getAccessToken() -> String {
        return accessToken ?? ""
    }
}

extension AuthenticationManager: LoggedUserLocalDataSource {
  public func saveUser(userId: Int, sessionId: String) {
    self.accountId = String(userId)
    self.sessionId = sessionId
  }

  public func getUser() -> AccountDomain? {
    guard let currentAccountId = accountId,
          let accountId = Int(currentAccountId),
          let sessionId = sessionId else { return nil }
    return AccountDomain(id: accountId, sessionId: sessionId)
  }

  public func deleteUser() {
    accountId = nil
    sessionId = nil
  }
}


// MARK: - Constants

struct Constants {
    static let accessTokenKey = "TheMovieDB_AccessToken"
    static let requestTokenKey = "TheMovieDB_RequestToken"
    static let accountIdKey = "TheMovieDB_AccountId"
    static let sessionIdKey = "TheMovieDB_SessionId"
}
