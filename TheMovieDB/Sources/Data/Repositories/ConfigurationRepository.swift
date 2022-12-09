//
//  ConfigurationRepository.swift
//  UpcomingMoviesData
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

import Domain

public final class ConfigurationRepository: ConfigurationUseCaseProtocol {

    private let remoteDataSource: ConfigurationRemoteDataSourceProtocol

    init(remoteDataSource: ConfigurationRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    public func getConfiguration(completion: @escaping (Result<Configuration, Error>) -> Void) {
        remoteDataSource.getConfiguration(completion: completion)
    }
}
