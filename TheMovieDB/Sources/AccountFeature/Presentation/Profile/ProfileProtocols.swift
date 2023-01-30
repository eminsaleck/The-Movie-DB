//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 30.01.2023.
//

import Combine


protocol ProfileViewControllerDelegate{
    func logoutTapped(_ bool: Bool)
}

protocol ProfileViewModelDelegate {
    func option(_ option: UserListType)
}

protocol ProfileViewModelProtocol {
    var delegate: ProfileViewModelDelegate? { get set }
    func chosen(cell: ProfilesSectionItem)

    var dataSource: CurrentValueSubject<[ProfileSection], Never> { get }
    var presentAlert: CurrentValueSubject<Bool, Never> { get }
}
