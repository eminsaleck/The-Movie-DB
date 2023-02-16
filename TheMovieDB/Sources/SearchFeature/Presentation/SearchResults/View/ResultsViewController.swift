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

class ResultsSearchViewController: UIViewController {
    private let viewModel: ResultsViewModelProtocol
    private let resultView: ResultListView = ResultListView()
    typealias DataSource = UITableViewDiffableDataSource<ResultsSectionView, ResultsSectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ResultsSectionView, ResultsSectionItem>
    private var dataSource: DataSource?
    
    private var disposeBag = Set<AnyCancellable>()
    
    // MARK: - Life Cycle
    init(viewModel: ResultsSearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
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
        setupTableView()
        setupViewModel()
        setupTable()
    }
    
    private func setupTableView() {
        resultView.tableView.register(cellType: MovieCellViewModel.self)
        resultView.tableView.register(cellType: RecentsTableViewCell.self)
        resultView.tableView.delegate = self
    }
    
    // MARK: - SetupViewModel
    private func setupViewModel() {
        viewModel
            .viewState
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] state in
                self?.configView(with: state)
            })
            .store(in: &disposeBag)
    }
    
    // MARK: - Setup Table View
    private func setupTable() {
        setupDataSource()
        subscribe()
    }
    
    private func setupDataSource() {
        dataSource = CustomSectionTableViewDiffableDataSource(tableView: resultView.tableView, cellProvider: { [weak self] tableView, indexPath, model in
            guard let strongSelf = self else {
                fatalError()
            }
            
            switch model {
            case let .recentSearchs(model):
                return strongSelf.makeCellForRecentSearch(tableView, at: indexPath, element: model)
            case let .results(viewModel):
                return strongSelf.makeCellForResultSearch(tableView, at: indexPath, element: viewModel)
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
            .store(in: &disposeBag)
    }
    
    // MARK: - Handle View State
    private func configView(with state: ResultViewState) {
        let tableView = resultView.tableView
        
        switch state {
        case .initial :
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .singleLine
            
        case .loading:
            tableView.tableFooterView = LoadingView.defaultView
            tableView.separatorStyle = .none
            
        case .populated :
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .singleLine
            
        case .empty :
            messageView.messageLabel.text = "No results to Show"
            tableView.tableFooterView = messageView
            tableView.separatorStyle = .none
            
        case .error(let message):
            messageView.messageLabel.text = message
            tableView.tableFooterView = messageView
            tableView.separatorStyle = .none
        }
    }
}

// MARK: - UITableViewDelegate
extension ResultsSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let model = dataSource?.itemIdentifier(for: indexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            
            switch model {
            case .recentSearchs(let query) :
                viewModel.recentSearchIsPicked(query: query)
                
            case .results:
                viewModel.showIsPicked(index: indexPath.row)
            }
        }
    }
}

// MARK: - Build Cells
extension ResultsSearchViewController {
    private func makeCellForRecentSearch(_ tableView: UITableView, at indexPath: IndexPath, element: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: RecentSearchTableViewCell.self, for: indexPath)
        cell.setModel(with: element)
        return cell
    }
    
    private func makeCellForResultSearch(_ tableView: UITableView, at indexPath: IndexPath, element: TVShowCellViewModel) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TVShowViewCell.self, for: indexPath)
        cell.setModel(viewModel: element)
        return cell
    }
}
