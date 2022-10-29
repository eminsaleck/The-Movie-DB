//
//  MainAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation

final class MainAssembler: AssemblerProtocol {
    
  func assembly() -> MainController {
    let mainViewModel = MainViewModel()
    let mainController = MainController()
      mainController.viewModel = mainViewModel
    
    return mainController
  }
}
