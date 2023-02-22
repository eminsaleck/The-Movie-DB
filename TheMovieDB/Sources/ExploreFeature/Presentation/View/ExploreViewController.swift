//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import UIKit
import Combine
import Common
import UI

final class ExploreViewController: UIViewController, Loadable{
    
    private let viewModel: ExploreViewModelProtocol
    
    private var rootView: ExploreRootView?
    
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: ExploreViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        subscribe()
        viewModel.viewDidLoad()
    }
    
    override func loadView() {
        rootView = ExploreRootView(viewModel: viewModel)
        view = rootView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subscribe() {
        viewModel
            .viewState
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] state in
                self?.handleTableState(with: state)
            })
            .store(in: &disposeBag)
    }
    
    private func handleTableState(with state: ExploreViewState) {
        rootView?.stopRefresh()
        
        switch state {
        case .loading:
            showLoadingView()
            rootView?.collectionView.backgroundView = nil

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
