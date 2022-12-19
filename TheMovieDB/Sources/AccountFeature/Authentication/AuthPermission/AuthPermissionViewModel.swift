//
//  AuthPermissionViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//

import Foundation

public final class AuthPermissionViewModel: AuthPermissionViewModelProtocol {

    private var authPermissionURL: URL?

    // MARK: - Initializers

    public init(authPermissionURL: URL?) {
        self.authPermissionURL = authPermissionURL
    }

    // MARK: - AuthPermissionViewModelProtocol

    public var authPermissionURLRequest: URLRequest? {
        guard let authPermissionURL = authPermissionURL else { return nil }
        return URLRequest(url: authPermissionURL)
    }

}
