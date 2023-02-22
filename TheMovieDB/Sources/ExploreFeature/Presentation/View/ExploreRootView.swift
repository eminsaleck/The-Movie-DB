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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ExploreLayout())
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    typealias DataSource = UICollectionViewDiffableDataSource<ExploreSectionView, MovieCellViewModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ExploreSectionView, MovieCellViewModel>
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
        setupDataSource()
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
    private func setupCollectionView() {
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: Constants.cellID)
        collectionView.register(MainHeaderView.self,
                                forSupplementaryViewOfKind: Constants.headerSection,
                                withReuseIdentifier: Constants.headerSection)
        collectionView.register(LineView.self,
                                forSupplementaryViewOfKind: Constants.topLine,
                                withReuseIdentifier: Constants.topLine)
        collectionView.register(LineView.self,
                                forSupplementaryViewOfKind: Constants.bottomLine,
                                withReuseIdentifier: Constants.bottomLine)
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
            configSupplements(dataSource: dataSource)
        }
    }
    
    private func configSupplements(dataSource: DataSource){
        dataSource.supplementaryViewProvider = .some({ (collectionView, kind, indexPath) -> UICollectionReusableView? in
            
            switch kind {
            case Constants.headerSection:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: Constants.headerSection, withReuseIdentifier: Constants.headerSection, for: indexPath) as! MainHeaderView
                let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
                headerView.setModel(genre: section.header, id: section.id)
                
                headerView.buttonTapHandler = { [weak self] id in
                    self?.viewModel.moviesByGenre(id: id)
                }
                return headerView
            case Constants.topLine:
                let lineView = collectionView.dequeueReusableSupplementaryView(ofKind: Constants.topLine, withReuseIdentifier: Constants.topLine, for: indexPath) as! LineView
                      return lineView
            case Constants.bottomLine:
                let lineView = collectionView.dequeueReusableSupplementaryView(ofKind: Constants.bottomLine, withReuseIdentifier: Constants.bottomLine, for: indexPath) as! LineView
                      return lineView
            default:
                return nil
            }
        })
    }
    
    private func subscribe() {
        viewModel.dataSource
            .map { dataSource -> Snapshot in
                var snapshot = Snapshot()
                dataSource.forEach { section in
                    snapshot.appendSections([section.sectionView])
                    snapshot.appendItems(section.items, toSection: section.sectionView)
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
        static var headerSection: String = "headers"
        static var topLine: String = "topLine"
        static var bottomLine: String = "bottomLine"
    }
}
