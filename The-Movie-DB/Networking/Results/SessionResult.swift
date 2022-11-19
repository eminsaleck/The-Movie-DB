//
//  SessionResult.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

struct SessionResult: Decodable {

    let success: Bool
    let sessionId: String

    private enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }

}
