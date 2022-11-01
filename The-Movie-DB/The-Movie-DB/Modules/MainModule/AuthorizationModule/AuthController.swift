//
//  AuthController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import UIKit

final class AuthController: UIViewController {
  
  //MARK: - Properties
  weak var viewModel: AuthViewModelProtocol?
  var coordinator: AuthFlow?
    
    override func viewDidLoad() {
      super.viewDidLoad()
        coordinator?.coordinateToTabBar()
    }

}
