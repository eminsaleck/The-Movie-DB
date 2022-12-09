//
//  NetworkConfiguration.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

public final class NetworkConfiguration {

    public static let shared = NetworkConfiguration()

    public internal(set) var apiKey = ""
    public internal(set) var readAccessToken = ""

    var baseAPIURLString: String {
        return "https://api.themoviedb.org"
    }

    public init() {}

    func configure(with apiKey: String, and readAccessToken: String) {
        self.apiKey = apiKey
        self.readAccessToken = readAccessToken
    }

}
