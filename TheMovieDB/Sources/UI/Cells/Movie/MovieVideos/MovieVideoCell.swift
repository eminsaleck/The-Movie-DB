//
//  MovieVideoCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

final class MovieVideoCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var previewImageView: UIImageView!

    var viewModel: MovieVideoCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        previewImageView.cancelImageDownload()
        previewImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Private

    private func setupUI() {
        nameLabel.font = FontHelper.calloutLight
        nameLabel.textColor = ColorPalette.Label.defaultColor
        nameLabel.adjustsFontForContentSizeCategory = true
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.name
        previewImageView.setImage(with: viewModel.thumbnailURL)
    }

}
