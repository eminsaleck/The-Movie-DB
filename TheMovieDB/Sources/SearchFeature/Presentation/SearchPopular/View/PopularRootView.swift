//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//


import UIKit
import Combine
import UI

class PopularRootView: UIView {

  private let viewModel: SearchPopularViewModelProtocol

  let tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
      tableView.register(MovieViewCell.self, forCellReuseIdentifier: Constants.cellID)
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = UITableView.automaticDimension
    tableView.contentInsetAdjustmentBehavior = .automatic
    return tableView
  }()

  typealias DataSource = UITableViewDiffableDataSource<SearchPopularSectionView, MovieCellViewModel>
  typealias Snapshot = NSDiffableDataSourceSnapshot<SearchPopularSectionView, MovieCellViewModel>
  private var dataSource: DataSource?

  private var disposeBag = Set<AnyCancellable>()

  // MARK: - Initializer
  init(frame: CGRect = .zero, viewModel: SearchPopularViewModelProtocol) {
    self.viewModel = viewModel
    super.init(frame: frame)
    setupUI()
  }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  private func setupUI() {
    setupHierarchy()
    setupTableView()
    setupDataSource()
    subscribe()
  }

  private func setupHierarchy() {
    addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.frame = self.bounds
  }

  // MARK: - Setup TableView
  private func setupTableView() {
    tableView.delegate = self
    tableView.refreshControl = RefreshController( { [weak self] in
      self?.viewModel.refreshView()
    })
  }

  private func setupDataSource() {
      print("SS")

    dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, model in
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! MovieViewCell
      cell.setModel(viewModel: model)
      return cell
    })
  }

  private func subscribe() {
    viewModel
      .viewStateObservableSubject
      .map { viewState -> Snapshot in
        var snapShot = Snapshot()
          snapShot.appendSections([.movies])
        snapShot.appendItems(viewState.currentEntities, toSection: .movies)
        return snapShot
      }
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] snapshot in
        self?.dataSource?.apply(snapshot)
      })
      .store(in: &disposeBag)
  }

  func stopRefresh() {
    tableView.refreshControl?.endRefreshing(with: 0.5)
  }
}

// MARK: - UITableViewDelegate
extension PopularRootView: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    viewModel.movieIsPicked(index: indexPath.row)
  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      let totalItems = dataSource?.snapshot().itemIdentifiers(inSection: .movies).count ?? 0
    viewModel.willDisplayRow(indexPath.row, outOf: totalItems)
  }
}



extension PopularRootView {

    struct Constants {
        static var cellID: String = "cell"
    }
}
