//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import UIKit
import Combine
import Common
import UI

class ExploreViewController: UIViewController, Loadable{
    
    private let viewModel: ExploreViewModelProtocol
    
    private var rootView: ExploreRootView?
    
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: ExploreViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
