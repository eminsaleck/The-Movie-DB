//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Foundation
import Combine
import Common
import Network
import MovieDetailsFeatureInterface

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    let viewState = CurrentValueSubject<DetailViewState, Never>(.loading)
    let isFavorite = CurrentValueSubject<Bool, Never>(false)
    let isWatchList = CurrentValueSubject<Bool, Never>(false)
    
    private let fetchLoggedUser: FetchLoggedUser
    private let fetchDetailsUseCase: FetchMovieDetailsUseCase
    private let fetchMovieAccountState: FetchAccountStates
    private let markAsFavoriteUseCase: MarkAsFavoriteUseCase
    private let saveToWatchListUseCase: SaveToWatchListUseCase
    
    private weak var coordinator: MovieDetailCoordinatorProtocol?
    
    private let movieId: Int
    private let tapFavoriteButton: PassthroughSubject<Bool, Never>
    private let markAsFavoriteOnFlight = CurrentValueSubject<Bool, Never>(false)
    
    private let tapWatchedButton: PassthroughSubject<Bool, Never>
    private let addToWatchListOnFlight = CurrentValueSubject<Bool, Never>(false)
    
    private let closures: MovieDetailViewModelClosures?
    private var disposeBag = Set<AnyCancellable>()
    
    init(movieId: Int,
         fetchLoggedUser: FetchLoggedUser,
         fetchDetailsUseCase: FetchMovieDetailsUseCase,
         fetchMovieAccountState: FetchAccountStates,
         markAsFavoriteUseCase: MarkAsFavoriteUseCase,
         saveToWatchListUseCase: SaveToWatchListUseCase,
         coordinator: MovieDetailCoordinatorProtocol?,
         closures: MovieDetailViewModelClosures? = nil) {
        self.movieId = movieId
        self.fetchLoggedUser = fetchLoggedUser
        self.fetchDetailsUseCase = fetchDetailsUseCase
        self.fetchMovieAccountState = fetchMovieAccountState
        self.markAsFavoriteUseCase = markAsFavoriteUseCase
        self.saveToWatchListUseCase = saveToWatchListUseCase
        self.coordinator = coordinator
        self.closures = closures
        
        tapFavoriteButton = PassthroughSubject()
        tapWatchedButton = PassthroughSubject()
    }
    
    deinit {
        print("deinit \(Self.self)")
    }
    
    func viewDidLoad() {
        subscribe()
    }
    
    public func refreshView() {
        subscribeToViewAppears()
    }
    
    public func isUserLogged() -> Bool {
        return fetchLoggedUser.execute() == nil ? false : true
    }
    
    func favoriteButtonDidTapped() {
        tapFavoriteButton.send(true)
    }
    
    func watchedButtonDidTapped() {
        tapWatchedButton.send(true)
    }
    
    private func subscribe() {
        subscribeToViewAppears()
        subscribeButtonsWhenPopulated()
    }
    
    private func subscribeToViewAppears() {
        if isUserLogged() {
            requestMovieDetailsAndState()
        } else {
            requestMovieDetails()
        }
    }
    
    private func subscribeButtonsWhenPopulated() {
        viewState
            .sink(receiveValue: { [weak self] viewState in
                switch viewState {
                case .populated:
                    self?.subscribeFavoriteTap()
                    self?.subscribeWatchListTap()
                default:
                    break
                }
            })
            .store(in: &disposeBag)
    }
    
    private func subscribeFavoriteTap() {
        Publishers.CombineLatest(
            tapFavoriteButton,
            markAsFavoriteOnFlight
        )
        .filter { didSendTap, isLoading in
            return didSendTap && isLoading == false
        }
        .debounce(for: .milliseconds(150), scheduler: DispatchQueue.main)
        .flatMap { [weak self] _ -> AnyPublisher<Result<Bool, DataTransferError>, Never> in
            guard let self = self else { return Empty().eraseToAnyPublisher() }
            self.markAsFavoriteOnFlight.send(true)
            self.tapFavoriteButton.send(false)
            return self.markAsFavorite(state: self.isFavorite.value)
        }
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self] result in
            self?.markAsFavoriteOnFlight.send(false)
            switch result {
            case .failure:
                print("SASF")
                break
            case .success(let newState):
                self?.isFavorite.send(newState)
                self?.closures?.updateFavoritesMovies?(MovieUpdated(movieId: self?.movieId ?? 0, isActive: newState))
            }
        })
        .store(in: &disposeBag)
    }
    
    private func subscribeWatchListTap() {
        Publishers.CombineLatest3(
            tapWatchedButton,
            addToWatchListOnFlight,
            isWatchList
        )
        .filter { didUserTap, isOnFlight, _ in
            return didUserTap && isOnFlight == false
        }
        .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
        .flatMap { [weak self] (_, _, isOnWatchListState) -> AnyPublisher<Result<Bool, DataTransferError>, Never> in
            guard let strongSelf = self else { return Empty().eraseToAnyPublisher() }
            strongSelf.tapWatchedButton.send(false)
            strongSelf.addToWatchListOnFlight.send(true)
            return strongSelf.saveToWatchList(state: isOnWatchListState)
        }
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self] result in
            self?.addToWatchListOnFlight.send(false)
            switch result {
            case .failure:
                break
            case .success(let newState):
                print("asf")
                self?.isWatchList.send(newState)
                self?.closures?.updateWatchListMovies?(MovieUpdated(movieId: self?.movieId ?? 0, isActive: newState))
            }
        })
        .store(in: &disposeBag)
    }
    
    private func requestMovieDetails() {
        fetchMovieDetails()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case let .failure(error):
                    self?.viewState.send(.error(error.localizedDescription))
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] detailResult in
                self?.viewState.send(
                    .populated(MovieDetailInfoModel(movie: detailResult))
                )
            })
            .store(in: &disposeBag)
    }
    
    private func requestMovieDetailsAndState() {
        Publishers.Zip(fetchMovieDetails(), fetchMovieState())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    self.viewState.send(.error(error.localizedDescription))
                case .finished:
                    break
                }
            }, receiveValue: { [viewState, isFavorite, isWatchList] (resultDetails, stateShow) in
                viewState.send( .populated(MovieDetailInfoModel(movie: resultDetails)) )
                isFavorite.send(stateShow.isFavorite)
                isWatchList.send(stateShow.isWatchList)
            })
            .store(in: &disposeBag)
    }
    
    private func fetchMovieDetails() -> AnyPublisher<MovieDetail, DataTransferError> {
        let request = FetchMovieDetailsUseCaseRequestValue(identifier: movieId)
        return fetchDetailsUseCase.execute(requestValue: request)
    }
    
    private func fetchMovieState() -> AnyPublisher<MovieAccountStatus, DataTransferError> {
        let request = FetchAccountStatesRequestValue(id: movieId)
        return fetchMovieAccountState.execute(requestValue: request)
    }
    
    private func markAsFavorite(state: Bool) -> AnyPublisher<Result<Bool, DataTransferError>, Never> {
        let request = MarkAsFavoriteUseCaseRequestValue(movieId: movieId, favorite: !state)
        return markAsFavoriteUseCase.execute(requestValue: request)
            .map { .success($0) }
            .replaceError(with: .failure(DataTransferError.noResponse))
            .eraseToAnyPublisher()
    }
    
    private func saveToWatchList(state: Bool) -> AnyPublisher<Result<Bool, DataTransferError>, Never> {
        let request = SaveToWatchListUseCaseRequestValue(movieId: movieId, watchList: !state)
        return saveToWatchListUseCase.execute(requestValue: request)
            .map { .success($0) }
            .replaceError(with: .failure(DataTransferError.noResponse))
            .eraseToAnyPublisher()
    }
}
extension MovieDetailViewModel {
    public func navigateToSeasons() {
        navigateTo(state: .movieDetailsIsRequired(withId: movieId) )
    }
    
    public func viewDidFinish() {
        navigateTo(state: .detailViewDidFinish)
    }
    
    fileprivate func navigateTo(state: MovieDetailsState) {
        coordinator?.navigate(with: state)
    }
}
