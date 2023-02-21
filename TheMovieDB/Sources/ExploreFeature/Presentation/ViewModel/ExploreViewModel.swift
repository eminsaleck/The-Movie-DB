//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import Combine
import Common
import UI

final class ExploreViewModel: ExploreViewModelProtocol {
    
    let viewStateObservableSubject: CurrentValueSubject<SimpleViewState<MovieCellViewModel>, Never> = .init(.loading)
    private var bag = Set<AnyCancellable>()
    
    private let fetchGenresUseCase: FetchGenresUseCase
    private let fetchMoviesByGenreUseCase: FetchMoviesByGenreUseCase
    
    weak var coordinator: ExploreCoordinatorProtocol?
    
    init(fetchGenresUseCase: FetchGenresUseCase,
         fetchMoviesByGenreUseCase: FetchMoviesByGenreUseCase) {
        self.fetchGenresUseCase = fetchGenresUseCase
        self.fetchMoviesByGenreUseCase = fetchMoviesByGenreUseCase
        fetch()
    }
    
    func viewDidLoad() {
        //
    }
    
    private func fetchGenres() -> AnyPublisher<GenreCollection, ErrorEnvelope> {
        return fetchGenresUseCase.execute(requestValue: FetchGenresUseCaseRequestValue())
            .mapError { error -> ErrorEnvelope in return ErrorEnvelope(transferError: error) }
            .eraseToAnyPublisher()
    }
    
    private func fetchMoviesByGenre(genre: Int) -> AnyPublisher<MoviePage, ErrorEnvelope> {
        let requestValue = FetchMoviesByGenreUseCaseRequestValue(genreID: genre)
        return fetchMoviesByGenreUseCase.execute(requestValue: requestValue)
            .mapError { error -> ErrorEnvelope in return ErrorEnvelope(transferError: error) }
            .eraseToAnyPublisher()
    }

    private func fetch() {
        fetchMoviesByGenre(genre: 10770)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                print(error)
                case .finished:
                    break
                }
            },
                  receiveValue: { genre in
                print(genre)
            })
            .store(in: &bag)
    }
    
    private func navigateWith(state: ExploreState) {
        coordinator?.navigate(with: state)
    }
    
    func movieIsPicked(index id: Int) {
        navigateWith(state: .movieIsPicked(id: id))
    }
    
    func moviesByGenre(id: Int, title: String){
        navigateWith(state: .allIsPicked(id: id, title: title))
    }
}
