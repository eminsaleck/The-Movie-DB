//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation

import UIKit
import Combine
import UI

class ExploreRootView: UIView {
    
    private let viewModel: ExploreViewModelProtocol
    
    init(frame: CGRect = .zero, viewModel: ExploreViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
