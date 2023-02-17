//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import UIKit

public protocol Loadable {
  func showLoadingView()
  func hideLoadingView()
}


public extension Loadable where Self: UIViewController {

  func showLoadingView() {
    let loadingView = LoadingView()

    loadingView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(loadingView)

    loadingView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    loadingView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    loadingView.tag = ConstantsLoadable.loadingViewTag
  }

  func hideLoadingView() {
    view.subviews.forEach { subview in
      if subview.tag == ConstantsLoadable.loadingViewTag {
        subview.removeFromSuperview()
      }
    }
  }
}

// MARK: - ConstantsLoadable

private struct ConstantsLoadable {
  fileprivate static let loadingViewTag = 12345
}
