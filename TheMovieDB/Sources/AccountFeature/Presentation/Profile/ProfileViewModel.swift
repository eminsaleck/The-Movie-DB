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
    let presentAlert = CurrentValueSubject<Bool, Never>(false)
        
    init(_ account: Account){
        let section = createSection(account: account)
        dataSource.send(section)
    }
    
    private func createSection(account: Account) -> [ProfileSection] {
      let items: [ProfilesSectionItem] = [
        .userLists(items: .favorites),
        .userLists(items: .watchList)
      ]

      let sectionProfile: [ProfileSection] = [
        .userInfo(items: [.userInfo(number: account)]),
        .userLists(items: items),
        .logout(items: [.logout(items: "Log Out")])
      ]
      return sectionProfile
    }
    
    func chosen(cell: ProfilesSectionItem) {
        switch cell {
        case .userLists(items: let type):
            delegate?.option(type)
        case .logout:
            presentAlert.send(true)
        default:
            break
        }
    }

}



