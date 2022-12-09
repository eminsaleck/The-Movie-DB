//
//  ReviewResult.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

import Domain

public struct ReviewResult: Decodable, Paginable {

    let results: [Review]
    var currentPage: Int
    var totalPages: Int

    private enum CodingKeys: String, CodingKey {
        case results
        case currentPage = "page"
        case totalPages = "total_pages"
    }

}
