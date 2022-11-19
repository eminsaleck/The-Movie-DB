//
//  RemoteDataSource.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Data

final public class RemoteDataSource: RemoteDataSourceProtocol {
    
    public func configure(with apiKey: String, readAccessToken: String) {
        NetworkConfiguration.shared.configure(with: apiKey, and: readAccessToken)
    }
    
    public func accountDataSource() -> AccountRemoteDataSourceProtocol {
        let client = AccountClient()
        return AccountRemoteDataSource(client: client)
    }
    
    public func authDataSource() -> AuthRemoteDataSourceProtocol {
        let authClient = AuthClient()
        let accountClient = AccountClient()
        return AuthRemoteDataSource(authClient: authClient, accountClient: accountClient)
    }
    
    
    public init() {}
    
    
}
