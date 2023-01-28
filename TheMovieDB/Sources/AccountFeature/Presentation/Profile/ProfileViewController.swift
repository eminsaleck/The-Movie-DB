//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import UIKit
import UI

class ProfileViewController: UIViewController {
    
    private viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel){
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
    
}
