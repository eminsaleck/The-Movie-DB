//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import UIKit

extension UIRefreshControl {

  public func endRefreshing(with delay: TimeInterval = 0.5) {
    if isRefreshing {
      perform(#selector(UIRefreshControl.endRefreshing), with: nil, afterDelay: delay)
    }
  }
}
