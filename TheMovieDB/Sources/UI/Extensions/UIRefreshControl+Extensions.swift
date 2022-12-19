//
//  UIRefreshControl+Extensions.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

extension UIRefreshControl {

    func endRefreshing(with delay: TimeInterval = 0.5) {
        if isRefreshing {
            perform(#selector(UIRefreshControl.endRefreshing), with: nil, afterDelay: delay)
        }
    }

}
