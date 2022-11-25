//
//  File.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 25.11.2022.
//

import Foundation

final class AuthPermissionViewModel: AuthPermissionViewModelProtocol {

    private var authPermissionURL: URL?

    // MARK: - Initializers

    init(authPermissionURL: URL?) {
        print("SS")
        self.authPermissionURL = authPermissionURL
    }

    // MARK: - AuthPermissionViewModelProtocol

    var authPermissionURLRequest: URLRequest? {
        guard let authPermissionURL = authPermissionURL else { return nil }
        return URLRequest(url: authPermissionURL)
    }

}
