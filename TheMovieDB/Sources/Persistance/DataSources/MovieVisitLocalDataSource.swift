//
//  MovieVisitLocalDataSource.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import Domain
import Data

final class MovieVisitLocalDataSource: MovieVisitLocalDataSourceProtocol {

    private let store: PersistenceStore<CDMovieVisit>

    var didUpdateMovieVisit: (() -> Void)?

    // MARK: - Initializers

    init(store: PersistenceStore<CDMovieVisit>) {
        self.store = store
        self.store.configureResultsContoller(limit: 10, sortDescriptors: CDMovieVisit.defaultSortDescriptors)
        self.store.delegate = self
    }

    // MARK: - MovieVisitLocalDataSourceProtocol

    func getMovieVisits(completion: @escaping (Result<[MovieVisit], Error>) -> Void) {
        store.findAll { movieVisits in
            completion(.success(movieVisits.map { $0.asDomain() }))
        }
    }

    func save(with id: Int, title: String, posterPath: String?,
              completion: @escaping (Result<Void, Error>) -> Void) {
        store.saveMovieVisit(with: id, title: title, posterPath: posterPath)
        completion(.success(Void()))
    }

}

// MARK: - PersistenceStoreDelegate

extension MovieVisitLocalDataSource: PersistenceStoreDelegate {

    func persistenceStore(willUpdateEntity shouldPrepare: Bool) {}

    func persistenceStore(didUpdateEntity update: Bool) {
        didUpdateMovieVisit?()
    }

}
