//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import UIKit
import Combine
import Common
import UI

import UIKit

class MovieDetailViewController: UIViewController, Loadable {
    
    private var rootView: MovieDetailRootView?
    private var viewModel: MovieDetailViewModelProtocol
    
    private lazy var favoriteButton: UIBarButtonItem = {
        return UIBarButtonItem()
    }()
    
    private lazy var watchListButton: UIBarButtonItem = {
        return UIBarButtonItem()
    }()
    
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: MovieDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        rootView = MovieDetailRootView(viewModel: viewModel)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}
