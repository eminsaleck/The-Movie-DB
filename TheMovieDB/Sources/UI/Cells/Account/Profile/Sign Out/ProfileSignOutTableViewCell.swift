//
//  ProfileSignOutTableViewCell.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

class ProfileSignOutTableViewCell: UITableViewCell {

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Private

    private func setupUI() {
        textLabel?.text = LocalizedStrings.signOut()
        textLabel?.textAlignment = .center
        textLabel?.textColor = ColorPalette.redColor
        textLabel?.font = FontHelper.calloutLight
        textLabel?.adjustsFontForContentSizeCategory = true
    }

}
