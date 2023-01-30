//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import Foundation
import Combine


final class ProfileViewModel: ProfileViewModelProtocol{

    var delegate: ProfileViewModelDelegate?
    
    let dataSource = CurrentValueSubject<[ProfileSection], Never>([])
    let presentSignOutAlert = CurrentValueSubject<Bool, Never>(false)
    
    private let account: Account
    
    init(_ account: Account){
        self.account = account
    }
    
    func chosen(cell: ProfilesSectionItem) {
        switch cell {
        case .userLists(items: let type):
            delegate?.option(type)
        case .logout:
            presentSignOutAlert.send(true)
        default:
            break
        }
    }

}



