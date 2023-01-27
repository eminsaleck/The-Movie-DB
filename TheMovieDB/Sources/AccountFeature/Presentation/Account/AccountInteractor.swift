//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation
import Common
import Combine
import Network

protocol AccountInteractorProtocol{
    func currentUserID() -> AccountDomain?
    func createSession() -> AnyPublisher<Void, DataTransferError>
    func getDetails() -> AnyPublisher<Account, DataTransferError>
    func deleteUser() -> Void
}

class AccountInteractor {
    
    private let createNewSession: CreateSessionUseCase
    private let fetchLoggedUser: FetchLoggedUser
    private let fetchAccountDetails: FetchAccountDetailsUseCase
    private let deleteLoggedUser: DeleteLoggedUserUseCase

    init(createNewSession: CreateSessionUseCase,
         fetchAccountDetails: FetchAccountDetailsUseCase,
         fetchLoggedUser: FetchLoggedUser,
         deleteLoggedUser: DeleteLoggedUserUseCase
    ) {
        self.createNewSession = createNewSession
        self.fetchAccountDetails = fetchAccountDetails
        self.fetchLoggedUser = fetchLoggedUser
        self.deleteLoggedUser = deleteLoggedUser
    }
}

extension AccountInteractor: AccountInteractorProtocol{

    func currentUserID() -> AccountDomain? {
        fetchLoggedUser
            .execute()
            .getUser()
    }
    
    func createSession() -> AnyPublisher<Void, Network.DataTransferError> {
        createNewSession
            .execute()
            .createSession()
            .map { _ in
              return (())
            }
            .eraseToAnyPublisher()
    }
    
    func getDetails() -> AnyPublisher<Account, Network.DataTransferError> {
        fetchAccountDetails
            .execute()
            .getAccountDetails()
    }
    
    func deleteUser() -> Void {
        deleteLoggedUser
            .execute()
            .deleteUser()
    }
    
    
}

