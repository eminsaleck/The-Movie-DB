//
//  BaseSliderController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class TabBarController: UIViewController {
    
    var viewModel: TabBarViewModelProtocol!
    var coordinator: TabBarCoordinator!
    
    fileprivate let mainNavController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
       

    }
    
    
}
