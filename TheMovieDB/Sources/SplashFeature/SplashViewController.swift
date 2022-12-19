//
//  SplashViewController.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import UI
import Handlers

class SplashViewController: UIViewController, Storyboarded {

    static var storyboardName: String = "Main"

    var viewModel: SplashViewModelProtocol?

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // We can only get the window and scene of this view controller
        // only after it has been added to the window hierarchy
        setupBindables()
        viewModel?.startInitialDownloads()
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        viewModel?.initialDownloadsEnded = { [weak self] in
            guard let self = self else { return }
            let navigationHandler: NavigationHandlerProtocol = DIContainer.shared.resolve()
            DispatchQueue.main.async {
                navigationHandler.initialTransition(from: self.view.window)
            }
        }
    }

}
