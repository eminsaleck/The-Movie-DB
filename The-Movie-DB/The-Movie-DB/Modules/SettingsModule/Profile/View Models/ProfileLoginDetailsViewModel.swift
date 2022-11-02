//
//  ProfileLoginDetailsViewModel.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

enum LoginDetails: String {
    case email = "Email Address"
    case username = "Username"
    case oldPassword = "Old Password"
    case newPassword = "New Password"
    case confirmPassword = "Confirm Password"
}

class ProfileLoginDetailsViewModel {
    
    enum Section: Int {
        case loginDetails
       
        var sectionDescription: String {
            switch self {
            case .loginDetails:
                return "LOGIN DETAiLS"
            }
        }
    }
    
    typealias RowData = (title: String, value: String?, isSecureTextEntry: Bool)
    
    var profile: Profile
    
    var tableData = [[RowData]]()
    
    init(profile: Profile) {
        self.profile = profile
        buildTable()
    }
    
    private func buildTable() {
        buildProfileSection()
    }
    
    private func buildProfileSection() {
        let rows:[RowData] = [
            (LoginDetails.email.rawValue, profile.email, false),
            (LoginDetails.username.rawValue, profile.username, false),
            (LoginDetails.oldPassword.rawValue, nil, true),
            (LoginDetails.newPassword.rawValue, nil, true),
            (LoginDetails.confirmPassword.rawValue, nil, true),
        ]
        tableData.append(rows)
    }
    
    func rowData(at indexPath: IndexPath) -> RowData {
        let section = tableData[indexPath.section]
        return section[indexPath.row]
    }
    
    func numberOfSections() -> Int {
        return tableData.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return tableData[section].count
    }
    
    func headerTitle(for section: Int) -> String? {
        let sectionData = Section(rawValue: section)
        return sectionData?.sectionDescription
    }
}
