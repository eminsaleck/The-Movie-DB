//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import UIKit
import Combine
import UI

final class ExploreRootView: UIView {
    
    private let viewModel: ExploreViewModelProtocol
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    typealias DataSource = UICollectionViewDiffableDataSource<String, MovieCellViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<String, MovieCellViewModel>
    private var dataSource: DataSource?
    
    private var bag = Set<AnyCancellable>()
    
    init(frame: CGRect = .zero, viewModel: ExploreViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
    private func setupUI() {
        setupHierarchy()
        setupCollectionView()
        //        setupDataSource()
        subscribe()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    // MARK: - Setup CollectionView
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { (collectionView, indexPath, model) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellID, for: indexPath) as! MovieViewCell
            cell.setModel(viewModel: model)
            return cell
        }
        guard let dataSource = dataSource else { return }
        //        setupHeader(dataSource)
    }
    //    private func setupHeader(_ dataSource: DataSource) {
    //        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
    //            guard let sectionView = ExploreSectionView(header: indexPath.section) else {
    //                return nil
    //            }
    //
    //            switch kind {
    //            case UICollectionView.elementKindSectionHeader:
    //                if sectionView == .genre {
    //                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.headerID, for: indexPath) as! SectionHeaderView
    //                    let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
    //                    headerView.setTitle(section.header)
    //                    return headerView
    //                } else {
    //                    return nil
    //                }
    //            default:
    //                return nil
    //            }
    //        }
    //    }
    
    private func subscribe() {
        viewModel.dataSource
            .map { dataSource -> Snapshot in
                var snapshot = Snapshot()
                dataSource.forEach { section in
                    guard let a = section.sectionView else { return }
                    snapshot.appendSections([a])
                    snapshot.appendItems(section.items, toSection: a)
                }
                return snapshot
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] snapshot in
                self?.dataSource?.apply(snapshot)
            })
            .store(in: &bag)
    }
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
    
    func allButtonIsClicked(id: Int, title: String) {
        viewModel.moviesByGenre(id: id, title: title)
    }
    
    func stopRefresh() {
        collectionView.refreshControl?.endRefreshing(with: 0.5)
    }
}

extension ExploreRootView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        viewModel.movieIsPicked(index: indexPath.item)
    }
}

extension ExploreRootView {
    struct Constants {
        static var cellID: String = "cells"
        static var headerID: String = "headers"
        static var headerReuseIdentifier: String = "headerReuses"
    }
}
