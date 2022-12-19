//
//  PlaceholderDisplayable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

typealias Placeholderable = Displayable & Detailable
typealias RetryPlaceHolderable = Displayable & Detailable & RetryActionable

protocol PlaceholderDisplayable: Retryable, Emptiable {}

extension PlaceholderDisplayable where Self: UIViewController {

    func hideDisplayedPlaceholderView() {
        hideEmptyView()
        hideRetryView()
    }

}
