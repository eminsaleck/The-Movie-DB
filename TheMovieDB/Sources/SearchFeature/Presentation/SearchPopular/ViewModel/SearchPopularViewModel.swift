//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//
import Foundation
import Combine
import Network
import Common
import UI


final class SearchPopularViewModel: SearchPopularViewModelProtocol {
    
    let fetchPopularUseCase: PopularUseCase
    
    var shows: [MoviePage.Movie]
    var showsCells: [MovieCellViewModel] = []
    weak var delegate: SearchPopularViewModelDelegate?
    let viewStateObservableSubject: CurrentValueSubject<SimpleViewState<MovieCellViewModel>, Never> = .init(.loading)
    var disposeBag = Set<AnyCancellable>()
    
    // MARK: - Initializers
    init(fetchPopularUseCase: PopularUseCase) {
        self.fetchPopularUseCase = fetchPopularUseCase
        shows = []
    }
    
    func viewDidLoad() {
        getMovies(for: 1)
    }
    
    func willDisplayItem(_ item: Int, outOf totalRows: Int) {
        
        if case .paging(_, let nextPage) = viewStateObservableSubject.value, item == totalRows - 1 {
            print("REQUEST - : NEXTPAGE:\(nextPage)")
            getMovies(for: nextPage)
        }
    }
    
    func refreshView() {
        getMovies(for: 1, showLoader: false)
    }
    
    func movieIsPicked(index: Int) {
        if shows.indices.contains(index) {
            delegate?.searchPopularViewModel(self, popularMoviePicked: shows[index].id)
        }
    }
    
    // MARK: - Private
    private func getMovies(for page: Int, showLoader: Bool = true) {
        
        if viewStateObservableSubject.value.isInitialPage, showLoader {
            viewStateObservableSubject.send(.loading)
        }
        
        let request = PopularUseCaseRequestValue(page: page)
        
        fetchPopularUseCase.execute(requestValue: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case let .failure(error):
                    print(error)
                    self?.handleError(error)
                case .finished: break
                }
            }, receiveValue: { [weak self] result in
                self?.processFetched(for: result, currentPage: page)
            })
            .store(in: &disposeBag)
    }
    
    private func handleError(_ error: DataTransferError) {
        if viewStateObservableSubject.value.isInitialPage {
            viewStateObservableSubject.send(.error(error.localizedDescription))
        }
    }
    
    private func processFetched(for response: MoviePage, currentPage: Int) {
        if currentPage == 1 {
            shows.removeAll()
        }
        
        shows.append(contentsOf: response.results)
        
        if shows.isEmpty {
            viewStateObservableSubject.send(.empty)
            return
        }
        
        let cellsShows = mapToCell(entities: shows)
        
        if response.hasMorePages {
            viewStateObservableSubject.send( .paging(cellsShows, next: response.nextPage) )
        } else {
            viewStateObservableSubject.send( .populated(cellsShows) )
        }
    }
    
    private func mapToCell(entities: [MoviePage.Movie]) -> [MovieCellViewModel] {
        return entities.map { MovieCellViewModel(movie: $0) }
    }
}
