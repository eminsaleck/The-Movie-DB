//
//  DefaultRefreshControl.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

class DefaultRefreshControl: UIRefreshControl {

    private var refreshHandler: () -> Void

    // MARK: - Initializers

    init(tintColor: UIColor = ColorPalette.lightBlueColor,
         attributedTitle: String = "",
         backgroundColor: UIColor? = .clear,
         refreshHandler: @escaping () -> Void) {
        self.refreshHandler = refreshHandler
        super.init()
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.attributedTitle = NSAttributedString(string: attributedTitle,
                                                  attributes: [NSAttributedString.Key.font: FontHelper.caption1Light,
                                                               NSAttributedString.Key.foregroundColor: tintColor])
        addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: - Selectors

    @objc func refreshControlAction() {
        refreshHandler()
    }

}
