//
//  CollectionViewDataSourcePrefetching.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

final class CollectionViewDataSourcePrefetching: NSObject, DataSourcePrefetching, UICollectionViewDataSourcePrefetching {

    let cellCount: Int
    let needsPrefetch: Bool
    let prefetchHandler: (() -> Void)

    // MARK: - Initializers

    init(cellCount: Int, needsPrefetch: Bool, prefetchHandler: @escaping (() -> Void)) {
        self.cellCount = cellCount
        self.needsPrefetch = needsPrefetch
        self.prefetchHandler = prefetchHandler
    }

    // MARK: - UICollectionViewDataSourcePrefetching

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        prefetchIfNeeded(for: indexPaths)
    }

}
