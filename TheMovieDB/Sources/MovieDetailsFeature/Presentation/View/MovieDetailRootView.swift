//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import UIKit
import Common
import UI

class MovieDetailRootView: UIView {

  private let viewModel: MovieDetailViewModelProtocol

  // MARK: - Initializer
  init(frame: CGRect = .zero, viewModel: MovieDetailViewModelProtocol) {
    self.viewModel = viewModel
    super.init(frame: frame)
      backgroundColor = .red
  }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
