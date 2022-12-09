//
//  MovieResult.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

public struct MovieResult: Decodable, Paginable {

    let results: [Movie]
    var currentPage: Int
    var totalPages: Int

    private enum CodingKeys: String, CodingKey {
        case results
        case currentPage = "page"
        case totalPages = "total_pages"
    }

}
