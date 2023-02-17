//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 16.02.2023.
//
import Combine
import UIKit
import Common
import UI

class ResultsViewController: UIViewController {
    private let viewModel: ResultsViewModelProtocol
    private let resultView = ResultCollectionView()
    
    typealias DataSource = UICollectionViewDiffableDataSource<ResultsSectionView, ResultsSectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ResultsSectionView, ResultsSectionItem>
    private var dataSource: DataSource?
    
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: ResultsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindLayout()
        configCollectionView()
        configViewModel()
        setupCollection()
    }
    
    private func bindLayout() {
        viewModel.layout
            .sink { [weak self] layout in
                self?.resultView.layoutConfig = layout
            }
            .store(in: &bag)
    }
    
    private func configCollectionView() {
        resultView.collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: Constants.movieCell)
        resultView.collectionView.register(RecentsCell.self, forCellWithReuseIdentifier: Constants.recentsCell)
        resultView.collectionView.delegate = self
    }
    
    private func configViewModel() {
        viewModel
            .viewState
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] state in
                self?.configView(with: state)
            })
            .store(in: &bag)
    }
    
    private func setupCollection() {
        configDataSource()
        subscribe()
    }
    
    private func configDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: resultView.collectionView, cellProvider: { [weak self] collectionView, indexPath, model in
            switch model {
            case let .recentSearchs(model):
                return self?.makeCellForRecentSearch(collectionView, at: indexPath, element: model)
            case let .results(viewModel):
                return self?.makeCellForResultSearch(collectionView, at: indexPath, element: viewModel)
            }
        })
    }
    
    private func subscribe() {
        viewModel
            .dataSource
            .map { dataSource -> Snapshot in
                var snapShot = Snapshot()
                for element in dataSource {
                    snapShot.appendSections([element.section])
                    snapShot.appendItems(element.items, toSection: element.section)
                }
                return snapShot
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] snapshot in
                self?.dataSource?.apply(snapshot)
            })
            .store(in: &bag)
    }
    
    private func configView(with state: ResultViewState) {
        let collectionView = resultView.collectionView
        
        switch state {
        case .initial :
            collectionView.backgroundView = nil
            
        case .loading:
            collectionView.backgroundView = LoadingView.defaultView
            
        case .populated :
            collectionView.backgroundView = nil
            
        case .empty :
            collectionView.backgroundView = EmptyView.defaultView
            
        case .error(_):
            collectionView.backgroundView = EmptyView.defaultView
            
        }
    }
}

extension ResultsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let dataSource = dataSource else { return }
        let totalItems = dataSource.collectionView(collectionView, numberOfItemsInSection: indexPath.section)
        if indexPath.item == totalItems - 1 {
            viewModel.willDisplayItem()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let model = dataSource?.itemIdentifier(for: indexPath) {
            switch model {
            case .recentSearchs(let query):
                viewModel.recentSearchIsPicked(query: query)
            case .results:
                viewModel.movieIsPicked(id: indexPath.item)
            }
        }
    }
}

extension ResultsViewController {
    private func makeCellForRecentSearch(_ collectionView: UICollectionView, at indexPath: IndexPath, element: String) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.recentsCell,
                                                      for: indexPath) as! RecentsCell
        cell.setModel(with: element)
        return cell
    }
    
    private func makeCellForResultSearch(_ collectionView: UICollectionView, at indexPath: IndexPath, element: MovieCellViewModel) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.movieCell, for: indexPath) as! MovieViewCell
        cell.setModel(viewModel: element)
        return cell
    }
}

extension ResultsViewController{
    struct Constants {
        static var movieCell = "MovieCellID"
        static var recentsCell = "recentsCellID"
    }
    
}
