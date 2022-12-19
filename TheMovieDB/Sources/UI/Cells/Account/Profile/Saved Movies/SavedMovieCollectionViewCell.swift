//
//  SavedMovieCollectionViewCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit
import CollectionViewSlantedLayout

class SavedMovieCollectionViewCell: CollectionViewSlantedCell {

    @IBOutlet private weak var backdropImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    var viewModel: SavedMovieCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        backdropImageView.cancelImageDownload()
        backdropImageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Private

    private func setupUI() {
        setupLabels()
    }

    private func setupLabels() {
        titleLabel.font = FontHelper.bodyBold
        titleLabel.textColor = ColorPalette.whiteColor
        titleLabel.adjustsFontForContentSizeCategory = true
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        backdropImageView.setImage(with: viewModel.backdropURL)
    }

}
