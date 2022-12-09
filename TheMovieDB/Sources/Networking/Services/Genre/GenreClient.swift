//
//  GenreClient.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

class GenreClient: APIClient, GenreClientProtocol {

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

    // MARK: - GenreClientProtocol

    func getAllGenres(completion: @escaping (Result<GenreResult, APIError>) -> Void) {
        fetch(with: GenreProvider.getAll.request, decode: { json -> GenreResult? in
            guard let genreFeedResult = json as? GenreResult else { return  nil }
            return genreFeedResult
        }, completion: completion)
    }

}
