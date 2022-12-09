//
//  SessionResult.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

struct SessionResult: Decodable {

    let success: Bool
    let sessionId: String

    private enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }

}
