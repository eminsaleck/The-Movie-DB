//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Network
import Networking
import Common

final class DefaultGenreRepository {
    private let mapper: MoviePageMapperProtocol
    private let remoteDataSource: GenreRemoteDataSource
    private let imageBasePath: String
    
    
    init(remoteDataSource: GenreRemoteDataSource, mapper: MoviePageMapperProtocol, imageBasePath: String) {
        self.mapper = mapper
        self.remoteDataSource = remoteDataSource
        self.imageBasePath = imageBasePath
    }
}

extension DefaultGenreRepository: GenresRepository {
    
    func genresCollection() -> AnyPublisher<GenreCollection, DataTransferError> {
        return remoteDataSource.fetchGenres()
            .flatMap { genreCollectionDTO -> AnyPublisher<[GenreMovies], DataTransferError> in
                let moviePublishers = genreCollectionDTO.genres.map { self.moviesByGenre(genreId: $0.id) }
                return Publishers.MergeMany(moviePublishers).collect()
                    .map { moviesByGenre in
                        genreCollectionDTO.genres.enumerated().map { (id, genreDTO) -> GenreMovies in
                            let movies = moviesByGenre[id]
                            return GenreMovies(id: genreDTO.id, name: genreDTO.name, movies: movies)
                        }
                    }
                    .eraseToAnyPublisher()
            }
            .map { (genreMovies: [GenreMovies]) -> GenreCollection in
                GenreCollection(genres: genreMovies)
            }
            .eraseToAnyPublisher()
    }
    
    func moviesByGenre(genreId: Int) -> AnyPublisher<[MoviePage.Movie], Network.DataTransferError> {
        return remoteDataSource.fetchMoviesByGenre(genreId: genreId)
            .map { self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium).results }
            .eraseToAnyPublisher()
    }
}

