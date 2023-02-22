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
    case genre(id: Int, header: String?)
    
    var id: Int {
        switch self {
        case .genre(let id, _):
            return id
        }
    }
    
    var header: String? {
        switch self {
        case .genre(_, let header):
            return header
        }
    }
    
    init(id: Int, header: String?) {
        self = .genre(id: id, header: header)
    }
}
