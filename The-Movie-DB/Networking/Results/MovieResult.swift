//
//  MovieResult.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

struct MovieResult: Decodable, Paginable {

    let results: [Movie]
    var currentPage: Int
    var totalPages: Int

    private enum CodingKeys: String, CodingKey {
        case results
        case currentPage = "page"
        case totalPages = "total_pages"
    }

}
