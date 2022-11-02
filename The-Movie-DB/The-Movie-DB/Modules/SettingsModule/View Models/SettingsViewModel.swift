//
//  SettingsViewModel.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/4/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

struct SettingsViewModel {
    var showProfile = true
    
    let profileSectionTitle = "PROFILE MENU"
    let publicSectionTitle = "OTHERS"
    
    func numberOfSections() -> Int {
        return showProfile ? 2 : 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        if showProfile {
            return section == 0 ? ProfileMenuOption.allCases.count : PublicMenuOption.allCases.count
        }
        return PublicMenuOption.allCases.count
    }
    
    func menuOption(for indexPath: IndexPath) -> MenuOption {
        if showProfile {
            if indexPath.section == 0 {
                if indexPath.row == 0 {
                    return ProfileViewModel(profile: ModelFactory.dummyProfile())
                }
                return ProfileMenuOption(rawValue: indexPath.row)!
            }
            return PublicMenuOption(rawValue: indexPath.row)!
        }
        return PublicMenuOption(rawValue: indexPath.row)!
    }
    
    func headerTitle(for section: Int) -> String {
        if showProfile {
            return section == 0 ? profileSectionTitle : publicSectionTitle
        }
        return publicSectionTitle
    }
}
