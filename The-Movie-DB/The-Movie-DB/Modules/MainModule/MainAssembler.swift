//
//  MainAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation

final class MainAssembler: AssemblerProtocol {
    
    func assembly() -> MainViewController {
        let networkManager = NetworkManager()
        let dataManager = StorageManager()
        let mainNetworkViewModel = MainNetworkViewModel(networkManager: networkManager)
        let mainViewController = MainViewController()
        mainViewController.viewModel.dataManager = dataManager
        mainViewController.viewModelNetwork = mainNetworkViewModel
        return mainViewController
    }
}
