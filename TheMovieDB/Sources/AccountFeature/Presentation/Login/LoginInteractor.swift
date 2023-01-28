//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import Foundation
import Combine
import Network

protocol LoginInteractorProtocol{
    func execute() -> AnyPublisher<URL, DataTransferError>
}

final class LoginInteractor: LoginInteractorProtocol{
    
   private let createTokenUseCase: CreateTokenUseCase
    
    init(createTokenUseCase: CreateTokenUseCase){
        self.createTokenUseCase = createTokenUseCase
    }
    
    func execute() -> AnyPublisher<URL, DataTransferError>{
        return createTokenUseCase.execute()
    }
}
