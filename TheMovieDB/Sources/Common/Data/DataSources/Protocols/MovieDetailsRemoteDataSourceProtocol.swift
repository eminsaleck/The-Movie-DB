//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import Foundation
import Combine
import Network

public protocol MovieDetailsRemoteDataSourceProtocol {
  func fetchMovieDetails(with id: Int) -> AnyPublisher<MovieDetailDTO, DataTransferError>
}
