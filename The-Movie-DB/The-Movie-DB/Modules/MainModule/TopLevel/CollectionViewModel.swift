//
//  MainCollectionViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import UIKit
import RxSwift

class CollectionViewModel<CellType: UICollectionViewCell & Providable>: NSObject {
    
    typealias Item = CellType.ProvidedItem
    typealias DataSource = UICollectionViewDiffableDataSource<Genre, Item>
    
    private weak var collectionView: UICollectionView?
    public var items: Binding<[Item]> = .init([])
    
    private var dataSource: DataSource?
    private var cellIdentifier: String
    
    
    init(collectionView: UICollectionView, cellReuseIdentifier: String) {
        self.cellIdentifier = cellReuseIdentifier
        self.collectionView = collectionView
        super.init()
    }
}

extension CollectionViewModel{
    
    
    public func addItems(items: [Item], to section: Genre) {
        items.forEach { self.items.value.append($0) }
        guard let dataSource = dataSource else { return }
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
}

extension CollectionViewModel {
    private func cellProvider(_ collectionView: UICollectionView,
                              indexPath: IndexPath,
                              item: Item) -> UICollectionViewCell?
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CellType
        cell.provide(item)
        return cell
    }
    
    private func supplementaryViewProviderFor(_ dataSource: DataSource) {
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            if indexPath.section == 0{
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: TopHeaderView.reuseIdentifier,
                    for: indexPath) as! TopHeaderView
                let name = String(describing: Genre.allCases[indexPath.section]).capitalized
                sectionHeader.label.text = name
                return sectionHeader
            } else {
                
                let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderView.reuseIdentifier,
                    for: indexPath) as! HeaderView
                let name = String(describing: Genre.allCases[indexPath.section]).capitalized
                sectionHeader.label.text = name
                return sectionHeader
            }
        }
    }
    public func makeDataSource() -> DataSource {
        guard let collectionView = collectionView else { fatalError("CollectionView isn't here :(") }
        let dataSource = DataSource(collectionView: collectionView,
                                    cellProvider: cellProvider)
        supplementaryViewProviderFor(dataSource)
        self.dataSource = dataSource
        return dataSource
    }
}
