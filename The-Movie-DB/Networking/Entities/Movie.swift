//
//  Movie.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases

struct Movie: Decodable {

    let id: Int
    let title: String
    let genreIds: [Int]?
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let voteAverage: Double?

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case genreIds = "genre_ids"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }

    init(id: Int, title: String, genreIds: [Int]?,
         overview: String, posterPath: String?, backdropPath: String?,
         releaseDate: String, voteAverage: Double?) {
        self.id = id
        self.title = title
        self.genreIds = genreIds
        self.overview = overview
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }

}

extension Movie: UseCasesConvertible {

    func asDomain() -> UseCases.Movie {
        return UseCases.Movie(id: id, title: title,
                                          genreIds: genreIds, overview: overview,
                                          posterPath: posterPath, backdropPath: backdropPath,
                                          releaseDate: releaseDate, voteAverage: voteAverage)
    }

}
