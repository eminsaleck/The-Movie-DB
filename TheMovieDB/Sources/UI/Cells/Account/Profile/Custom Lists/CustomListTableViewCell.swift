//
//  CustomListTableViewCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

class CustomListTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    var viewModel: CustomListCellViewModelProtocol? {
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
        setupLabels()
    }

    private func setupLabels() {
        nameLabel.textColor = ColorPalette.lightBlueColor
        nameLabel.font = FontHelper.body
        nameLabel.adjustsFontForContentSizeCategory = true

        descriptionLabel.textColor = ColorPalette.lightBlueColor
        descriptionLabel.font = FontHelper.subheadLight
        descriptionLabel.adjustsFontForContentSizeCategory = true
    }

    // MARK: - Reactive Behavior

    private func setupBindables() {
        nameLabel.text = viewModel?.name
        if let description = viewModel?.description {
            descriptionLabel.text = description
        } else {
            descriptionLabel.isHidden = true
        }
    }

}
