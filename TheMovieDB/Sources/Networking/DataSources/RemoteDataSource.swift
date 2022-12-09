//
//  RemoteDataSource.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Data

final public class RemoteDataSource: RemoteDataSourceProtocol {

    public init() {}

    public func configure(with apiKey: String, readAccessToken: String) {
        NetworkConfiguration.shared.configure(with: apiKey, and: readAccessToken)
    }

    public func movieDataSource() -> MovieRemoteDataSourceProtocol {
        let client = MovieClient()
        return MovieRemoteDataSource(client: client)
    }

    public func genreDataSource() -> GenreRemoteDataSourceProtocol {
        let client = GenreClient()
        return GenreRemoteDataSource(client: client)
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

    public func configurationDataSource() -> ConfigurationRemoteDataSourceProtocol {
        let configurationClient = ConfigurationClient()
        return ConfigurationRemoteDataSource(client: configurationClient)
    }

}
