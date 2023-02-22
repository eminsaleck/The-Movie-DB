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
    case genre(header: SectionHeaderModel, movies: [MovieCellViewModel])
    
    var sectionView: SectionHeaderModel {
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
    case genre
}


struct SectionHeaderModel: Hashable {
    let title: String

    init(title: String) {
        self.title = title
    }
}

