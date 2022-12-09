//
//  RateMovieResult.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

struct RateMovieResult: Decodable {

    let statusCode: Int
    let statusMessage: String

    private enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }

}
