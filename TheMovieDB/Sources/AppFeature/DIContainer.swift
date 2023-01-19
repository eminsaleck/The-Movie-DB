//
//  DIContainer.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import UI
import Shared
import UIKit
import KeychainStorage
import Network
import Networking

public class DIContainer {
    
    private let appConfigurations: AppConfigurationProtocol
    
    private lazy var keyChainStorage = AuthenticationManager()
    
    private let language: Language

    private lazy var apiDataTransferService: DataTransferService = {
      let queryParameters = [
        "api_key": appConfigurations.apiKey,
        "language": language.rawValue
      ]

      let configuration = ApiDataNetworkConfig(
        baseURL: appConfigurations.apiBaseURL,
        headers: [
          "Content-Type": "application/json; charset=utf-8"
        ],
        queryParameters: queryParameters
      )
      let networkService = DefaultNetworkService(config: configuration)
      return DefaultDataTransferService(with: networkService)
    }()

    private lazy var localStorage: LocalStorage = {
        return LocalStorage(coreDataStorage: .shared)
    }()

    lazy var showsPersistence: ShowsVisitedLocalRepositoryProtocol = {
      return ShowsVisitedLocalRepository(dataSource: localStorage.getShowVisitedDataSource(limitStorage: 10),
                                         loggedUserRepository: loggedUserRepository)
    }()

    lazy var searchPersistence: SearchLocalRepository = {
      return SearchLocalRepository(dataSource: localStorage.getRecentSearchesDataSource(),
                                   loggedUserRepository: loggedUserRepository)
    }()

    lazy var loggedUserRepository: LoggedUserRepositoryProtocol = {
      return LoggedUserRepository(dataSource: keyChainStorage)
    }()

    lazy var requestTokenRepository: RequestTokenRepositoryProtocol = {
      return RequestTokenRepository(dataSource: keyChainStorage)
    }()

    lazy var accessTokenRepository: AccessTokenRepositoryProtocol = {
      return AccessTokenRepository(dataSource: keyChainStorage)
    }()

    public init(appConfigurations: AppConfigurationProtocol) {
      self.appConfigurations = appConfigurations

      language = Language(languageStrings: Locale.preferredLanguages) ?? .en
      Strings.currentLocale = Locale(identifier: language.rawValue)
    }
}

// MARK: - Assembling Modules
public extension DIContainer {
    
}

// MARK: - Assembling Module on top 
public extension DIContainer {
    
}
