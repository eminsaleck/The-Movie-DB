//
//  DIContainer.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import UI
import AccountFeature
import SearchFeature
import Common
import UIKit
import KeychainStorage
import Network
import Networking
import PersistanceRealm
import Persistance
import MovieDetailsFeature
import MovieDetailsFeatureInterface
import MovieListFeature
import MovieListFeatureInterface

public class DIContainer {
    
    private let appConfigurations: AppConfigurationProtocol
    
    private lazy var keyChainStorage = AuthenticationManager()
    
    private let language: Language
    
    private lazy var apiDataTransferService: DataTransferServiceProtocol = {
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
        let networkService = NetworkService(config: configuration)
        return DataTransferService(with: networkService)
    }()
    
    private lazy var localStorage: LocalStorage = {
        return LocalStorage(realmStorage: .shared)
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
        Localized.currentLocale = Locale(identifier: language.rawValue)
    }
    
    // MARK: - Account feature
    func buildAccountModule() -> AccountFeature.Module {
        let dependencies = AccountFeature.FeatureDependencies(apiDataTransferService: apiDataTransferService,
                                                              imagesBaseURL: appConfigurations.imagesBaseURL,
                                                              authenticateBaseURL: appConfigurations.authenticateBaseURL,
                                                              gravatarBaseURL: appConfigurations.gravatarBaseURL,
                                                              requestTokenRepository: requestTokenRepository,
                                                              accessTokenRepository: accessTokenRepository,
                                                              userLoggedRepository: loggedUserRepository,
                                                              showListBuilder: self)
        return AccountFeature.Module(dependencies: dependencies)
    }
    // MARK: - Search feature
    func buildSearchModule() -> SearchFeature.Module {
        let dependencies = SearchFeature.FeatureDependencies(apiDataTransferService: apiDataTransferService,
                                                             imagesBaseURL: appConfigurations.imagesBaseURL,
                                                             searchsPersistence: searchPersistence)
        return SearchFeature.Module(dependencies: dependencies)
    }
}

extension DIContainer: ModuleMovieDetailsBuilderProtocol {
    public func buildModuleCoordinator(in navigationController: UINavigationController,
                                       delegate: MovieDetailCoordinatorDelegate?) -> MovieDetailCoordinatorProtocol {
        let dependencies = MovieDetailsFeatureInterface.ModuleDependencies(apiDataTransferService: apiDataTransferService,
                                                                           imagesBaseURL: appConfigurations.imagesBaseURL,
                                                                           loggedUserRepository: loggedUserRepository)
        let module = MovieDetailsFeature.Module(dependencies: dependencies)
        return module.buildModuleCoordinator(in: navigationController, delegate: delegate)
    }
}

extension DIContainer: ModuleMovieListDetailsBuilderProtocol {
    
    public func buildModuleCoordinator(in navigationController: UINavigationController,
                                       delegate: MovieListCoordinatorDelegate?) -> MovieListCoordinatorProtocol {
        let dependencies = MovieListFeatureInterface.ModuleDependencies(apiDataTransferService: apiDataTransferService,
                                                                        imagesBaseURL: appConfigurations.imagesBaseURL,
                                                                        loggedUserRepository: loggedUserRepository,
                                                                        showDetailsBuilder: self)
        let module = MovieListFeature.Module(dependencies: dependencies)
        return module.buildModuleCoordinator(in: navigationController, delegate: delegate)
    }
}
