//
//  ConfigurationClient.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

class ConfigurationClient: APIClient, ConfigurationClientProtocol {

    let session: URLSession

    // MARK: - Initializers

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        self.init(configuration: configuration)
    }

    // MARK: - ConfigurationClientProtocol

    func getImagesConfiguration(completion: @escaping (Result<ImagesConfigurationResult, APIError>) -> Void) {
        fetch(with: ConfigurationProvider.getAPIConfiguration.request, decode: { json -> ImagesConfigurationResult? in
            guard let configuration = json as? ImagesConfigurationResult else { return nil }
            return configuration
        }, completion: completion)
    }

}
