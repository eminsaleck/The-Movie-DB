//
//  AuthPermissionProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//

import Foundation
import Shared
import WebKit

public protocol AuthPermissionViewModelProtocol {

    var authPermissionURLRequest: URLRequest? { get }

}

public protocol AuthPermissionCoordinatorProtocol: Coordinator {

    func dismiss(completion: (() -> Void)?)
    func didDismiss()

}

public protocol AuthPermissionWebViewNavigationDelegate: WKNavigationDelegate {

    var didFinishNavigation: () -> Void { get set }

}
