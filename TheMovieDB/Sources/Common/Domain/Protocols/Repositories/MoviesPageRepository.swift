//
//  File 2.swift
//
//
//  Created by LEMIN DAHOVICH on 231.01.2023.
//

import Combine
import Network

public protocol MoviePageRepository {
  func fetchPopularMovies(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func fetchMoviesByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func searchMovieFor(query: String, page: Int) -> AnyPublisher<MoviePage, DataTransferError>
}
