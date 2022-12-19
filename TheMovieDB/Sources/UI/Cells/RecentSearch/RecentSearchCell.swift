//
//  RecentSearchCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

final class RecentSearchCell: UITableViewCell {

    @IBOutlet private weak var searchLabel: UILabel!

    static let identifier = "RecentSearchCell"

    var viewModel: RecentSearchCellViewModelProtocol? {
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
        setupSearchLabel()
    }

    private func setupSearchLabel() {
        searchLabel.font = FontHelper.subheadLight
        searchLabel.textColor = ColorPalette.Label.defaultColor
        searchLabel.adjustsFontForContentSizeCategory = true
    }

    private func setupBindables() {
        searchLabel.text = viewModel?.searchText
    }

}
