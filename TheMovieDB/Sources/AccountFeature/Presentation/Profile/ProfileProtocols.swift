//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 30.01.2023.
//

import Combine

protocol ProfileViewModelDelegate {
    func option(_ option: UserListType)
}

protocol ProfileViewModelProtocol {
    func chosen(cell: ProfilesSectionItem)
    var delegate: ProfileViewModelDelegate? { get set }

    var dataSource: CurrentValueSubject<[ProfileSection], Never> { get }
    var presentSignOutAlert: CurrentValueSubject<Bool, Never> { get }
}
