//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import Combine
import Network

protocol FetchGenresUseCase {
  func execute(requestValue: FetchGenresUseCaseRequestValue) -> AnyPublisher<GenreCollection, DataTransferError>
}

struct FetchGenresUseCaseRequestValue { }

final class DefaultFetchGenresUseCase: FetchGenresUseCase {

  private let genresRepository: GenresRepository

  init(genresRepository: GenresRepository) {
    self.genresRepository = genresRepository
  }

  func execute(requestValue: FetchGenresUseCaseRequestValue) -> AnyPublisher<GenreCollection, DataTransferError> {
    return genresRepository.genresCollection()
  }
}
