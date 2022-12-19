//
//  GenreSearchOptionTableViewCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

final class GenreSearchOptionTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!

    var viewModel: GenreSearchOptionCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Private

    private func setupUI() {
        nameLabel.font = FontHelper.subheadLight
        nameLabel.textColor = ColorPalette.lightBlueColor
        nameLabel.adjustsFontForContentSizeCategory = true
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        nameLabel.text = viewModel?.name
    }

}
