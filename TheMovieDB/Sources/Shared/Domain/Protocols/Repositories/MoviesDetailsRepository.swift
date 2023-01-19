//
//  TVShowsDetailsRepository.swift
//  
//
//  Created by Jeans Ruiz on 13/05/22.
//

import Combine
import Networking

public protocol TVShowsDetailsRepository {
  func fetchTVShowDetails(with showId: Int) -> AnyPublisher<TVShowDetail, DataTransferError>
}
