//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import UIKit
import Combine
import UI

protocol SearchViewControllerDelegate {
    func buildSearchPopularController() -> UIViewController
}

class SearchViewController: UIViewController {
    
    private let viewModel: SearchViewModel
    private let delegate: SearchViewControllerDelegate
    private let searchController: UISearchController
    private var bag = Set<AnyCancellable>()
    
    init(viewModel: SearchViewModel,
         searchController: UISearchController,
         delegate: SearchViewControllerDelegate) {
        self.viewModel = viewModel
        self.searchController = searchController
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPopView()
        configSearchBar()
    }
    
    override func loadView() {
        view = UIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configPopView() {
        let popularViewController = delegate.buildSearchPopularController()
        add(asChildViewController: popularViewController)
    }
    
    private func bindSearchBarText() {
      viewModel.searchBarText
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { _ in },
              receiveValue: { [weak self] value in
          self?.searchController.searchBar.text = value
        })
        .store(in: &bag)
    }
    
    private func configSearchBar() {
      searchController.obscuresBackgroundDuringPresentation = false
      searchController.hidesNavigationBarDuringPresentation = false

      searchController.searchBar.placeholder = Localized.searchPlaceholder.localized()
      searchController.searchResultsUpdater = self
      searchController.searchBar.delegate = self

      navigationItem.searchController = searchController
      navigationItem.hidesSearchBarWhenScrolling = false

      definesPresentationContext = true
    }
}

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func searchButtonClicked(_ searchBar: UISearchBar) {
      if let query = searchBar.text {
        viewModel.startSearch(with: query)
      }
    }
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchResultsController?.view.isHidden = false
        if let isEmpty = searchController.searchBar.text?.isEmpty, isEmpty {
            viewModel.resetSearch()
        }
    }
}

extension SearchViewController {
    private func add(asChildViewController viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }
}
