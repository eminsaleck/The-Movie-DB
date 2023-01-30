//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation
import Combine
import Network
import Networking
import Common

public final class AccountRepositoryImplementation: AccountRepository {
    
    private let dependencies: AccountDependencies
    
    init(dependencies: AccountDependencies) {
        self.dependencies = dependencies
    }
    
    public func getAccountDetails() -> AnyPublisher<Account, DataTransferError> {
        let sessionId = dependencies.accessTokenRepository.getAccessToken()
        
        return dependencies.remoteDataSource.getAccountDetails(session: sessionId)
            .map {
                self.dependencies.userLoggedRepository.saveUser(userId: $0.id, sessionId: sessionId)
                let avatarURL = URL(string: "\(self.dependencies.gravatarBaseURL)/\($0.avatar?.gravatar?.hash ?? "" )")
                return Account(id: $0.id, userName: $0.userName, avatarURL: avatarURL)
            }
            .eraseToAnyPublisher()
    }
}





