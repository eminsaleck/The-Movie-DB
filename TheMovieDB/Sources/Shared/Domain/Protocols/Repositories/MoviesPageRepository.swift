//
//  TVShowsPageRepository.swift
//  Shared
//
//  Created by Jeans on 1/14/20.
//  Copyright © 2020 Jeans. All rights reserved.
//

import Combine
import Network

public protocol TVShowsPageRepository {
  func fetchAiringTodayShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func fetchPopularShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func fetchShowsByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func searchShowsFor(query: String, page: Int) -> AnyPublisher<MoviePage, DataTransferError>
}
