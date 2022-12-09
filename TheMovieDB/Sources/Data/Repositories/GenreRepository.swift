//
//  GenreRepository.swift
//  UpcomingMoviesData
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

import Domain

public final class GenreRepository: GenreUseCaseProtocol {

    private var localDataSource: GenreLocalDataSourceProtocol
    private var remoteDataSource: GenreRemoteDataSourceProtocol

    init(localDataSource: GenreLocalDataSourceProtocol,
         remoteDataSource: GenreRemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }

    public var didUpdateGenre: (() -> Void)? {
        didSet {
            self.localDataSource.didUpdateGenre = didUpdateGenre
        }
    }

    public func find(with id: Int, completion: @escaping (Result<Genre?, Error>) -> Void) {
        return completion(.success(localDataSource.find(with: id)))
    }

    public func fetchAll(completion: @escaping (Result<[Genre], Error>) -> Void) {
        let localGenres = localDataSource.findAll()
        if !localGenres.isEmpty { completion(.success(localGenres)) }

        remoteDataSource.getAllGenres(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let remoteGenres):
                self.localDataSource.saveGenres(remoteGenres)
                if localGenres.isEmpty { completion(.success(remoteGenres)) }
            case .failure:
                break
            }
        })
    }

}
