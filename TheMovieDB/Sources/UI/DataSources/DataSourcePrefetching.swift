//
//  DataSourcePrefetching.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation

protocol DataSourcePrefetching {

    var cellCount: Int { get }
    var needsPrefetch: Bool { get }
    var prefetchHandler: (() -> Void) { get }

    func isLoadingCell(for indexPath: IndexPath) -> Bool
    func prefetchIfNeeded(for indexPaths: [IndexPath])

}

extension DataSourcePrefetching {

    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= cellCount - 1
    }

    func prefetchIfNeeded(for indexPaths: [IndexPath]) {
        guard needsPrefetch else { return }
        if indexPaths.contains(where: isLoadingCell) {
            prefetchHandler()
        }
    }

}
