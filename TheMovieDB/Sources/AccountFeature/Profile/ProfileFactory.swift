//
//  ProfileFactory.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//
import Common

final class ProfileFactory: ProfileFactoryProtocol {

    var sections: [ProfileSection] {
        return [
            .accountInfo,
            .collections,
            .recommended,
            .customLists,
            .signOut
        ]
    }

    func profileOptions(for section: ProfileSection) -> [ProfileOptionProtocol] {
        switch section {
        case .accountInfo, .signOut:
            return []
        case .collections:
            return [ProfileOption.favorites, ProfileOption.watchlist]
        case .recommended:
            return [ProfileOption.recommended]
        case .customLists:
            return [ProfileOption.customLists]
        }
    }

}
