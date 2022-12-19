//
//  ToastDefaultConfiguration.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

enum ToastDefaultConfiguration {

    case success
    case failure

    var configuration: ToastConfigurationProtocol {
        switch self {
        case .success:
            return ToastSuccessConfiguration.shared
        case .failure:
            return ToastFailureConfiguration.shared
        }
    }

}
