//
//  MovieSearchRepository.swift
//  UpcomingMoviesData
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

import Domain

public final class MovieSearchRepository: MovieSearchUseCaseProtocol {

    private var localDataSource: MovieSearchLocalDataSourceProtocol

    public var didUpdateMovieSearch: (() -> Void)? {
        didSet {
            self.localDataSource.didUpdateMovieSearch = didUpdateMovieSearch
        }
    }

    init(localDataSource: MovieSearchLocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    public func getMovieSearches() -> [MovieSearch] {
        return localDataSource.getMovieSearches()
    }

    public func save(with searchText: String) {
        localDataSource.save(with: searchText)
    }

}
