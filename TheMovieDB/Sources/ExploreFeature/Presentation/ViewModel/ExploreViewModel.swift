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
    let viewState: CurrentValueSubject<ExploreViewState, Never> = .init(.loading)
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
    
    func movieIsPicked(index id: Int) {
        navigateWith(state: .movieIsPicked(id: id))
    }
    
    func moviesByGenre(id: Int, title: String){
        navigateWith(state: .allIsPicked(id: id, title: title))
    }
    
    func refreshView() {
        fetch()
    }
    
    //MARK: - Private
    private func fetch() {
        fetchGenres()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished: break
                }
            }, receiveValue: { [weak self] result in
                self?.processFetched(result.genres)
            })
            .store(in: &bag)
    }
    
    private func fetchGenres() -> AnyPublisher<GenreCollection, ErrorEnvelope> {
        return fetchGenresUseCase.execute(requestValue: FetchGenresUseCaseRequestValue())
            .mapError { error -> ErrorEnvelope in return ErrorEnvelope(transferError: error) }
            .eraseToAnyPublisher()
    }
    
    private func processFetched(_ response: [GenreMovies]) {
        if response.isEmpty {
            viewState.send(.empty)
        } else {
            viewState.send(.populated )
        }
        
        var sectionModels: [ExploreSectionModel] = []
        response.forEach { genre in
            let movies = genre.movies.map(MovieCellViewModel.init)
            let header = SectionHeaderModel(title: genre.name)
            let sectionModel = ExploreSectionModel.genre(header: header, movies: movies)
            sectionModels.append(sectionModel)
        }
        dataSource.send(sectionModels)
    }
    private func navigateWith(state: ExploreState) {
        coordinator?.navigate(with: state)
    }
    
}
