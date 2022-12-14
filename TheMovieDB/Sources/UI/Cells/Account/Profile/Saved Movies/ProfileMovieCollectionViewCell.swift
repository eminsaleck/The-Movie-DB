//
//  ProfileMovieCollectionViewCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit
import CollectionViewSlantedLayout

class SavedMovieCollectionViewCell: CollectionViewSlantedCell {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var viewModel: SavedMovieCellViewModel? {
        didSet {
            setupBindables()
        }
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
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
        titleLabel.font = FontHelper.bold(withSize: 18.0)
        titleLabel.textColor = ColorPalette.whiteColor
    }

    // MARK: - Reactive Behaviour

    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        backdropImageView.setImage(with: viewModel.backdropURL)
    }

}
