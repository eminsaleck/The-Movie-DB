//
//  ProfileSelectableOptionCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol ProfileSelectableOptionCellViewModelProtocol {

    var title: String? { get }

}

final class ProfileSelectableOptionCellViewModel: ProfileSelectableOptionCellViewModelProtocol {

    let title: String?

    init(_ profileCollectionOption: ProfileOptionProtocol) {
        self.title = profileCollectionOption.title
    }

}
