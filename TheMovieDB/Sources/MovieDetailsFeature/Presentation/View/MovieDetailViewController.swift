//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import UIKit
import Combine
import Common
import UI

class MovieDetailViewController: UIViewController, Loadable{
    
    private let viewModel: MovieDetailViewModelProtocol
    private var rootView: MovieDetailRootView?
    
    private lazy var favoriteButton: UIBarButtonItem = {
        return UIBarButtonItem()
    }()
    
    private lazy var watchListButton: UIBarButtonItem = {
        return UIBarButtonItem()
    }()
    
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        rootView = MovieDetailRootView(viewModel: viewModel)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViewModel()
        viewModel.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    deinit {
        viewModel.viewDidFinish()
        print("deinit \(Self.self)")
    }
    
    private func setupNavigationBar() {
        if viewModel.isUserLogged() {
            navigationItem.rightBarButtonItems = [favoriteButton, watchListButton]
        } else {
            navigationItem.rightBarButtonItems = []
        }
    }
    
    private func setupViewModel() {
        setupBindables()
    }
    
    private func setupBindables() {
        if viewModel.isUserLogged() {
            setupBindablesForUserLogged()
        }
        
        viewModel.viewState
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] state in
                self?.configView(with: state)
            })
            .store(in: &disposeBag)
    }
    
    private func setupBindablesForUserLogged() {
        favoriteButton.primaryAction = UIAction(
            image: UIImage(systemName: "heart.fill"),
            handler: { [weak self] _ in
                self?.viewModel.favoriteButtonDidTapped()
            })
        
        watchListButton.primaryAction = UIAction(
            image: UIImage(systemName: "bookmark.fill"),
            handler: { [weak self] _ in
                self?.viewModel.watchedButtonDidTapped()
            })
        
        viewModel
            .isFavorite
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] isFavorite in
                self?.favoriteButton.tintColor = isFavorite ? .systemRed : .systemGray
            })
            .store(in: &disposeBag)
        
        viewModel
            .isWatchList
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] isWatchList in
                self?.watchListButton.tintColor = isWatchList ? .systemGreen : .systemGray
            })
            .store(in: &disposeBag)
    }
    
    private func configView(with state: DetailViewState) {
        switch state {
        case .loading:
            showLoadingView()
            
        case .populated(let movieDetail):
            hideLoadingView()
            rootView?.setupView(with: movieDetail)
            
        case .error(let message):
            hideLoadingView()
        }
    }
}
