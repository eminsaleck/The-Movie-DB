//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import UIKit
import Common
import MovieListFeatureInterface

final class DIContainer {
    
    private let dependencies: FeatureDependencies
    
    private lazy var accountDependencies = AccountDependencies(
        remoteDataSource: AccountRemoteDataSourceImplementation(dataTransferService: dependencies.apiDataTransferService),
        accessTokenRepository: dependencies.accessTokenRepository,
        userLoggedRepository: dependencies.userLoggedRepository,
        gravatarBaseURL: dependencies.gravatarBaseURL)
    
    private lazy var authDependencies = AuthDependencies(
        remoteDataSource: AuthRemoteDataSourceImplementation(dataTransferService: dependencies.apiDataTransferService),
        requestTokenRepository: dependencies.requestTokenRepository,
        accessTokenRepository: dependencies.accessTokenRepository,
        tokenMapper: RequestTokenMapper(authenticateBaseURL: dependencies.authenticateBaseURL))
    
    private lazy var accountRepository: AccountRepository = {
        return AccountRepositoryImplementation(dependencies: accountDependencies)
    }()
    
    private lazy var authRepository: AuthRepository = {
        return AuthRepositoryImplementation(dependencies: authDependencies)
    }()
    
    private var interactor: AccountInteractorProtocol?
    private var accountViewModel: AccountViewModel?
    
    init(dependencies: FeatureDependencies) {
        self.dependencies = dependencies
        setupViewModel()
    }

    func setupViewModel(){
        interactor = AccountInteractor(createNewSession: makeCreateSessionUseCase(),
                                       fetchAccountDetails: makeFetchAccountDetailsUseCase(),
                                       fetchLoggedUser: makeFetchLoggedUserUseCase(),
                                       deleteLoggedUser: makeDeleteLoggedUserUseCase())
        
        accountViewModel = AccountViewModel(interactor: interactor!)
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
        return AccountCoordinator(navigationController: navigationController, dependencies: self)
    }
}

extension DIContainer{
    
    func makeCreateSessionUseCase() -> CreateSessionUseCase {
        return DefaultCreateSessionUseCase(authRepository: authRepository)
    }
    
    func makeFetchAccountDetailsUseCase() -> FetchAccountDetailsUseCase {
        return FetchAccountDetailsUseCaseImplementation(accountRepository: accountRepository)
    }
    
    func makeFetchLoggedUserUseCase() -> FetchLoggedUser {
        return FetchLoggedUserImplementation(loggedRepository: dependencies.userLoggedRepository)
    }
    
    func makeDeleteLoggedUserUseCase() -> DeleteLoggedUserUseCase {
        return DeleteLoggedUserUseCaseImplementation(loggedRepository: dependencies.userLoggedRepository)
    }
}

extension DIContainer: AccountCoordinatorDependencies {
    
    func buildAccountViewController(coordinator: AccountCoordinatorProtocol?) -> UIViewController {
        guard let accountViewModel = accountViewModel else { return UIViewController(nibName: nil, bundle: nil) }
        accountViewModel.coordinator = coordinator
        return AccountViewController(viewModel: accountViewModel, delegate: self)
    }
    
    func buildAuthPermissionViewController(url: URL, delegate: AuthPermissionViewModelDelegate?) -> AuthPermissionViewController {
        let authViewModel = AuthPermissionViewModel(url: url)
        authViewModel.delegate = delegate
        return AuthPermissionViewController(viewModel: authViewModel)
    }
}

extension DIContainer: AccountViewControllerDelegate {
    
    private func makeCreateTokenUseCase() -> CreateTokenUseCase {
        return DefaultCreateTokenUseCase(authRepository: authRepository)
    }
    
    func makeSignInViewController() -> UIViewController {
        let loginInteractor = LoginInteractor(createTokenUseCase: makeCreateTokenUseCase())
        
        let loginViewModel = LoginViewModel(interactor: loginInteractor)
        loginViewModel.delegate = accountViewModel
        return LoginViewController(viewModel: loginViewModel)
    }
    
    func makeProfileViewController(with account: Account) -> UIViewController {
        let profileViewModel = ProfileViewModel(account)
        let profileViewController = ProfileViewController(viewModel: profileViewModel, delegate: accountViewModel!)
        profileViewModel.delegate = accountViewModel
        return profileViewController
    }
}

