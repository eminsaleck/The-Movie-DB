//
//  FavouriteController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import UIKit

final class FavouriteController: UIViewController {
    var viewModel: FavouriteViewModelProtocol!
    var coordinator: FavouriteCoordinatorFlow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
}
