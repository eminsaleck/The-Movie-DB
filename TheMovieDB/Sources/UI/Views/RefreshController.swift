//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import UIKit

public class RefreshController: UIRefreshControl {

  var refreshHandler: () -> Void

  // MARK: - Initializer
  public init(tintColor: UIColor = .systemBlue,
              attributedTitle: String = "",
              backgroundColor: UIColor? = .clear,
              _ refreshHandler: @escaping () -> Void) {
    self.refreshHandler = refreshHandler
    super.init()
    self.tintColor = tintColor
    self.backgroundColor = backgroundColor
    self.attributedTitle = NSAttributedString(
      string: attributedTitle,
      attributes: [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17),
        NSAttributedString.Key.foregroundColor: tintColor
      ]
    )
    addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }

  @objc func refreshControlAction() {
    refreshHandler()
  }
}
