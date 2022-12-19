//
//  ProfileAccountInfoCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol ProfileAccountInforCellViewModelProtocol {

    var name: String { get }
    var username: String? { get }

}

final class ProfileAccountInforCellViewModel: ProfileAccountInforCellViewModelProtocol {

    let name: String
    let username: String?

    init(userAccount: User) {
        name = userAccount.name
        username = userAccount.username
    }

}
