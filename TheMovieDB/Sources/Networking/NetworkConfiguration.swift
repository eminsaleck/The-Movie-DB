//
//  NetworkConfiguration.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

final class NetworkConfiguration {

    static let shared = NetworkConfiguration()

    private(set) var apiKey = ""
    private(set) var readAccessToken = ""

    var baseAPIURLString: String {
        return "https://api.themoviedb.org"
    }

    private init() {}

    func configure(with apiKey: String, and readAccessToken: String) {
        self.apiKey = apiKey
        self.readAccessToken = readAccessToken
    }

}
