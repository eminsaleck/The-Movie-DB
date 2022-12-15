//
//  MovieDetailUIHelper.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit

final class MovieDetailUIHelper: MovieDetailUIHelperProtocol, LoadingDisplayable, Retryable {

    private let progressHUDAdapter: ProgressHUDAdapterProtocol

    // MARK: - LoadingDisplayable

    var loaderView: LoadingView = RadarView()

    // MARK: - Initializers

    init(progressHUDAdapter: ProgressHUDAdapterProtocol) {
        self.progressHUDAdapter = progressHUDAdapter
    }

    // MARK: - MovieDetailUIHelperProtocol

    func showHUD(with text: String) {
        progressHUDAdapter.showHUDWithOnlyText(text)
    }

    func showFullscreenLoader(in view: UIView) {
        showLoader(in: view)
    }

    func dismissFullscreenLoader() {
        hideLoader()
    }

}
