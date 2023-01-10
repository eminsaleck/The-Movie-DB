//
//  MovieReviewDetailViewController.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import UI

class MovieReviewDetailViewController: UIViewController, Storyboarded {

    @IBOutlet private weak var contentLabel: UILabel!

    static var storyboardName = "MovieDetail"

    var viewModel: MovieReviewDetailViewModelProtocol?
    weak var coordinator: MovieReviewDetailCoordinatorProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindables()
    }

    // MARK: - Private

    private func setupUI() {
        setupLabels()
    }

    private func setupLabels() {
        contentLabel.numberOfLines = 0
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        title = viewModel?.author
        contentLabel.text = viewModel?.content
    }

    // MARK: - Actions

    @IBAction func closeAction(_ sender: Any) {
        coordinator?.dismiss()
    }

}
