//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import UIKit
import Combine

class SearchPopularViewController: UIViewController{
    private let viewModel: SearchPopularViewModelProtocol
//    private var rootView: SearchPopularRootView?
    private var disposeBag = Set<AnyCancellable>()
    
    init(viewModel: SearchPopularViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
