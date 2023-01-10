//
//  UpcomingMoviesViewFactory.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import UI

final class UpcomingMoviesViewFactory {

    class func makeGridBarButtonItem() -> ToggleBarButtonItem {
        let preview = ToggleBarButtonItemContent(display: .right(#imageLiteral(resourceName: "List")),
                                                 accessibilityLabel: LocalizedStrings.expandMovieCellsHint())
        let detail = ToggleBarButtonItemContent(display: .right(#imageLiteral(resourceName: "Grid")),
                                                accessibilityLabel: LocalizedStrings.collapseMovieCellsHint())

        return ToggleBarButtonItem(contents: [preview, detail])
    }

}
