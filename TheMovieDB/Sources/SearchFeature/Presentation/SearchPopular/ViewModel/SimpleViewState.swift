//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Foundation

enum SimpleViewState<Entity>: Equatable where Entity: Equatable {

    case loading
    case paging([Entity], next: Int)
    case populated([Entity])
    case empty
    case error(Error)

    static func == (lhs: SimpleViewState<Entity>, rhs: SimpleViewState<Entity>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (let .paging(lhsMovies, lNextPage), let .paging(rhsMovies, rNextPage)):
            return (lhsMovies == rhsMovies) && (lNextPage == rNextPage)
        case (let .populated(lhsMovies), let .populated(rhsMovies)):
            return lhsMovies == rhsMovies
            
        case (.empty, .empty):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }

    var currentEntities: [Entity] {
        switch self {
        case .populated(let entities):
            return entities
        case .paging(let entities, _):
            return entities
        case .loading, .empty, .error:
            return []
        }
    }

    var currentPage: Int {
        switch self {
        case .loading, .populated, .empty, .error:
            return 1
        case .paging(_, let page):
            return page
        }
    }

    var isInitialPage: Bool {
        return currentPage == 1
    }

    var needsPrefetch: Bool {
        switch self {
        case .loading, .populated, .empty, .error:
            return false
        case .paging:
            return true
        }
    }

}
