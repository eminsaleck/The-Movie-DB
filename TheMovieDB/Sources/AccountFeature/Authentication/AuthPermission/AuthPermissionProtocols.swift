//
//  AuthPermissionProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//

import Foundation
import Shared
import WebKit

protocol AuthPermissionViewModelProtocol {

    var authPermissionURLRequest: URLRequest? { get }

}

protocol AuthPermissionCoordinatorProtocol: Coordinator {

    func dismiss(completion: (() -> Void)?)
    func didDismiss()

}

protocol AuthPermissionWebViewNavigationDelegate: WKNavigationDelegate {

    var didFinishNavigation: () -> Void { get set }

}
