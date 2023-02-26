//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Combine
import Network
import Common
import Foundation

public protocol FetchMovieDetailsUseCase {
  func execute(requestValue: FetchMovieDetailsUseCaseRequestValue) -> AnyPublisher<MovieDetail, DataTransferError>
}

public struct FetchMovieDetailsUseCaseRequestValue {
  let identifier: Int
}

public final class FetchMovieDetailsUseCaseImplementation: FetchMovieDetailsUseCase {
  private let movieDetailsRepository: MovieDetailsRepository
    
  public init(movieDetailsRepository: MovieDetailsRepository) {
    self.movieDetailsRepository = movieDetailsRepository
  }

  public func execute(requestValue: FetchMovieDetailsUseCaseRequestValue) -> AnyPublisher<MovieDetail, DataTransferError> {
    return movieDetailsRepository
      .fetchMovieDetails(with: requestValue.identifier)
      .receive(on: DispatchQueue.main)
      .mapError { _ -> DataTransferError in
         return DataTransferError.noResponse }
      .eraseToAnyPublisher()
  }
}
