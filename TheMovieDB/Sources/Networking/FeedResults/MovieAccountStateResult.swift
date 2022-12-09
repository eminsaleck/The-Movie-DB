//
//  MovieAccountStateResult.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

struct MovieAccountStateResult: Decodable {

    let id: Int
    let favorite: Bool
    let watchlist: Bool

}
