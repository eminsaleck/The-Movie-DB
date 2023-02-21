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
    
    let viewStateObservableSubject: CurrentValueSubject<ExploreViewState, Never> = .init(.loading)
    let dataSource = CurrentValueSubject<[ExploreSectionModel], Never>([])
    
    private var bag = Set<AnyCancellable>()
    
    private let fetchGenresUseCase: FetchGenresUseCase
    
    weak var coordinator: ExploreCoordinatorProtocol?
    
    init(fetchGenresUseCase: FetchGenresUseCase) {
        self.fetchGenresUseCase = fetchGenresUseCase
        fetch()
    }
    
    func viewDidLoad() {
        fetch()
    }
    
    private func fetchGenres() -> AnyPublisher<GenreCollection, ErrorEnvelope> {
        return fetchGenresUseCase.execute(requestValue: FetchGenresUseCaseRequestValue())
            .mapError { error -> ErrorEnvelope in return ErrorEnvelope(transferError: error) }
            .eraseToAnyPublisher()
    }
    
    private func fetch() {
        fetchGenres()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished: break
                }
            }, receiveValue: { result in
                print(result)
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
