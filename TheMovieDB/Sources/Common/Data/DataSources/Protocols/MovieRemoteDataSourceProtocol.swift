//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Combine
import Network

public protocol MovieRemoteDataSourceProtocol {

  func fetchPopularMovies(page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
  func fetchMoviesByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
  func searchMovieFor(query: String, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
}
