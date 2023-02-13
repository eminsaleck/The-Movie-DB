//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import UIKit

class SearchViewController: UIViewController {
    private let viewModel: SearchViewModel
    private let searchControllerFactory: SearchViewControllerFactory

    init(viewModel: SearchViewModel,
         searchControllerFactory: SearchViewControllerFactory) {
      self.viewModel = viewModel
      self.searchControllerFactory = searchControllerFactory
      super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
      view = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol SearchViewControllerFactory {
  func buildSearchPopularController() -> UIViewController
}
