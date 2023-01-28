//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import Foundation

protocol AccountViewModelDelegate {
    
}

protocol ProfileViewModelProtocol {
  // MARK: - Input
  func didTapLogoutButton()
  func didCellTap(model: ProfilesSectionItem)
  var delegate: ProfileViewModelDelegate? { get set }

  // MARK: - Output
  var dataSource: CurrentValueSubject<[ProfileSectionModel], Never> { get }
  var presentSignOutAlert: CurrentValueSubject<Bool, Never> { get }
}


final class ProfileViewModel{
    
    private let account: Account
    var delegate: AccountViewModelDelegate
    
    init(_ account: Account){
        self.account = account
    }
}

extension ProfileViewModel: AccountViewModelDelegate{
    
}
