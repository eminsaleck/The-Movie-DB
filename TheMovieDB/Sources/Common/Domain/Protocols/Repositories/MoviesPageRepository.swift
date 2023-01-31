//
//  File 2.swift
//
//
//  Created by LEMIN DAHOVICH on 231.01.2023.
//

import Combine
import Network

public protocol MoviePageRepository {
  func fetchAiringTodayShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func fetchPopularShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func fetchShowsByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func searchShowsFor(query: String, page: Int) -> AnyPublisher<MoviePage, DataTransferError>
}
