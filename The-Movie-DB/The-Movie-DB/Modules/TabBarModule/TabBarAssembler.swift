//
//  TabBarAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import Foundation

final class TabBarAssembler: AssemblerProtocol {
  
  func assembly() -> TabBarController {
    let tabBarController = TabBarController()
    let tabBarViewModel = TabBarViewModel()
      tabBarController.viewModel = tabBarViewModel
    return tabBarController
  }
}
