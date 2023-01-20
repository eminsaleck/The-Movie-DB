//
//  TVShowsDetailsRepository.swift
//  
//
//  Created by Jeans Ruiz on 13/05/22.
//

import Combine
import Network

public protocol TVShowsDetailsRepository {
  func fetchTVShowDetails(with showId: Int) -> AnyPublisher<MovieDetail, DataTransferError>
}