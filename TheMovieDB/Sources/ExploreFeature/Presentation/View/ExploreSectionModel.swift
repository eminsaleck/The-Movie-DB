//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import UI
import Common

enum ExploreSectionModel {
    case genre(header: ExploreSectionView, movies: [MovieCellViewModel])
    
    var sectionView: ExploreSectionView {
        switch self {
        case let .genre(header, _):
            return header
        }
    }
    
    var items: [MovieCellViewModel] {
        switch self {
        case let .genre(_, movies):
            return movies
        }
    }
}

enum ExploreSectionView: Hashable {
    case genre(header: String?)
    
    var header: String? {
        switch self {
        case .genre(let header):
            return header
        }
    }
    
    init(header: String?) {
        self = .genre(header: header)
    }
}
