//
//  MovieReviewCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

final class MovieReviewCell: UITableViewCell {

    @IBOutlet private weak var authorNameLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!

    var viewModel: MovieReviewCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        setupLabels()
    }

    private func setupLabels() {
        authorNameLabel.font = FontHelper.calloutSemiBold
        authorNameLabel.adjustsFontForContentSizeCategory = true
        contentLabel.font = FontHelper.subheadLight
        contentLabel.adjustsFontForContentSizeCategory = true
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        authorNameLabel.text = viewModel?.authorName
        contentLabel.text = viewModel?.content
    }

}
