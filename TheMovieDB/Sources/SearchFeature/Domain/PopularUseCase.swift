//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Combine
import Common
import Network
import Foundation

public protocol PopularUseCase {
    func execute(requestValue: PopularUseCaseRequestValue) -> AnyPublisher<MoviePage, DataTransferError>
}

public struct PopularUseCaseRequestValue {
    public let page: Int
    
    public init(page: Int) {
        self.page = page
    }
}

final class PopularUseCaseImplementation: PopularUseCase {
    private let moviePageRepository: MoviePageRepository
    
    public init(moviePageRepository: MoviePageRepository) {
        self.moviePageRepository = moviePageRepository
    }
    
    func execute(requestValue: PopularUseCaseRequestValue) -> AnyPublisher<MoviePage, DataTransferError> {
        return moviePageRepository.fetchPopularMovies(page: requestValue.page)
            .eraseToAnyPublisher()
    }
}
