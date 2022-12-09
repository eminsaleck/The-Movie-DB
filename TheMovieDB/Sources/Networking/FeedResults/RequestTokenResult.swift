//
//  RequestTokenResult.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

public struct RequestTokenResult: Decodable {

    let success: Bool
    let token: String

    private enum CodingKeys: String, CodingKey {
        case success
        case token = "request_token"
    }

}
