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
    
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    
    typealias DataSource = UICollectionViewDiffableDataSource<SearchPopularSectionView, MovieCellViewModel>
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
        setupCollectionView()
        setupDataSource()
        subscribe()
    }
    
    private func setupHierarchy() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Setup CollectionView
    private func setupCollectionView() {
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: Constants.cellID)
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: Constants.headerReuseIdentifier)
        collectionView.delegate = self
        collectionView.refreshControl = RefreshController( { [weak self] in
            self?.viewModel.refreshView()
        })
    }
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, model) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as! MovieViewCell
            cell.setModel(viewModel: model)
            return cell
        }
        if let dataSource = dataSource {
            configHeader(dataSource: dataSource)
        }
    }
    
    private func configHeader(dataSource: DataSource){
        dataSource.supplementaryViewProvider = .some({ (collectionView, kind, indexPath) -> UICollectionReusableView? in
            return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.headerReuseIdentifier, for: indexPath) as! HeaderView
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
        collectionView.refreshControl?.endRefreshing(with: 0.5)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
}

// MARK: - UICollectionViewDelegate
extension PopularRootView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        viewModel.movieIsPicked(index: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let totalItems = dataSource?.collectionView(collectionView, numberOfItemsInSection: indexPath.section) ?? 0
        viewModel.willDisplayItem(indexPath.item, outOf: totalItems)
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension PopularRootView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 30)
    }
}

extension PopularRootView {
    struct Constants {
        static var cellID: String = "cell"
        static var headerID: String = "header"
        static var headerReuseIdentifier: String = "headerReuse"
    }
}
