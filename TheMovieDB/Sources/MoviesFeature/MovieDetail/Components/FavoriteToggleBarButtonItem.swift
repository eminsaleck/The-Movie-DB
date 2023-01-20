//
//  FavoriteToggleBarButtonItem.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//
import UIKit
import UI
import Common

class FavoriteToggleBarButtonItem: ToggleBarButtonItem {

    init() {
        let favoriteOff = ToggleBarButtonItemContent(display: .right(#imageLiteral(resourceName: "FavoriteOff")),
                                                     accessibilityLabel: LocalizedStrings.addToFavoritesHint())
        let favoriteOn = ToggleBarButtonItemContent(display: .right(#imageLiteral(resourceName: "FavoriteOn")),
                                                    accessibilityLabel: LocalizedStrings.removeFromFavoritesHint())
        super.init(contents: [favoriteOff, favoriteOn])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
