//
//  MainAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation

final class MainAssembler: AssemblerProtocol {
    
  func assembly() -> MainViewController {
      let mainViewModel = MainViewModel(networkManager: NetworkManager())
    let mainViewController = MainViewController()
      mainViewController.viewModel = mainViewModel
    
    return mainViewController
  }
}
