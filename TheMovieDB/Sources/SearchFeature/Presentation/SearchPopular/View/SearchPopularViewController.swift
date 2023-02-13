//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//


import UIKit
import Combine
import Common
import UI

class SearchPopularViewController: UIViewController, Loadable{
    
    private let viewModel: SearchPopularViewModelProtocol
    
    private var rootView: PopularRootView?
    
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: SearchPopularViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        rootView = PopularRootView(viewModel: viewModel)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
        viewModel.viewDidLoad()
    }
    
    private func subscribe() {
        viewModel
            .viewStateObservableSubject
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] state in
                self?.handleTableState(with: state)
            })
            .store(in: &disposeBag)
    }
    
    private func handleTableState(with state: SimpleViewState<MovieCellViewModel>) {
        rootView?.stopRefresh()
        
        switch state {
        case .loading:
            showLoadingView()
            rootView?.collectionView.backgroundView = nil
            
        case .paging:
            hideLoadingView()
            
        case .populated:
            hideLoadingView()
            rootView?.collectionView.backgroundView = nil
            
        case .empty:
            hideLoadingView()
            rootView?.collectionView.backgroundView = nil
            
        case .error(let message):
            hideLoadingView()
            rootView?.collectionView.backgroundView = nil
        }
    }
    
    private func stopRefreshControl() {
        rootView?.stopRefresh()
    }
}
