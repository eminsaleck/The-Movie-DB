//
//  ConfigurationRemoteDataSource.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain
import Data

final class ConfigurationRemoteDataSource: ConfigurationRemoteDataSourceProtocol {

    private let client: ConfigurationClientProtocol

    init(client: ConfigurationClientProtocol) {
        self.client = client
    }

    func getConfiguration(completion: @escaping (Result<Domain.Configuration, Error>) -> Void) {
        let sortConfigurationResult = SortConfigurationResult(movieSortKeys: [])
        client.getImagesConfiguration { result in
            switch result {
            case .success(let imagesConfigurationResult):
                let configuration = Configuration(imagesConfiguration: imagesConfigurationResult,
                                                  sortConfiguration: sortConfigurationResult)
                completion(.success(configuration.asDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
