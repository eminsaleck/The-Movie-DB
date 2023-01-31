//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Combine
import Network

public protocol MovieRemoteDataSourceProtocol {
  func fetchAiringTodayShows(page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
  func fetchPopularShows(page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
  func fetchShowsByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
  func searchShowsFor(query: String, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
}
