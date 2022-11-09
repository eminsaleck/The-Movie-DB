//
//  FavouriteController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import UIKit

final class SearchController: UIViewController {

    
    var viewModel: SearchViewModelProtocol!
    var coordinator: SearchCoordinatorFlow!
    
    private let searchResultsController = SearchResultsController()
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController:searchResultsController)
        controller.searchBar.placeholder = "Search for a movie or tv"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    var movies = [Film]()
    
    private let discoverTable : UITableView = {
        $0.register(DiscoverViewCell.self, forCellReuseIdentifier: DiscoverViewCell.reuseIdentifier)
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchDiscoverMovies()
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
        searchResultsController.delegate = self
        searchController.searchResultsUpdater = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
}

extension SearchController{
    private func setup(){
        navigationItem.searchController = searchController
        
        view.addSubview(discoverTable)
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = .black
    }
    
    private func fetchDiscoverMovies(){
        NetworkManager().fetchDiscoverMovies { [weak self] result in
            switch result{
            case .success(let films):
                self?.movies = films
                DispatchQueue.main.async {
                    self?.discoverTable.reloadData()
                }
            case .failure(let erro):
                print("\(erro.localizedDescription)")
            }
        }
    }
}

extension SearchController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverViewCell.reuseIdentifier, for: indexPath) as? DiscoverViewCell else { return UITableViewCell()}
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.coordinateToDetails(with: movies[indexPath.row], navigationController: navigationController!)
    }
}

extension SearchController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              let resultController = searchController.searchResultsController as? SearchResultsController else {
            return
            
        }
        NetworkManager().search(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let films):
                    resultController.movies = films
                    resultController.searchResultsCollectionView.reloadData()
                case .failure(_):
                    print("SS")
                }
            }
        }
    }
}

extension SearchController: SearchResultsViewControllerDelegate{
    func searchResultsViewControllerDidTapItem(_ film: Film) {
        coordinator.coordinateToDetails(with: film, navigationController: navigationController!)
        print(film)
    }
    
    
}
