//
//  CreditResult.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

import Domain

struct CreditResult: Decodable {

    let id: Int
    let cast: [Cast]
    let crew: [Crew]

}
