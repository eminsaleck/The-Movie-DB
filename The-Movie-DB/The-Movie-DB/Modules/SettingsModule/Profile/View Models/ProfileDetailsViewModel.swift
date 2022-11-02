
//
//  ProfileDetailsViewModel.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/25/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

enum ProfileDetails: String {
    case firstname = "First Name"
    case lastname = "Last Name"
    case birthdate = "Birthdate"
    case city = "City"
    case gender = "Gender"
    case occupation = "Occupation"
    case photographerType = "Photographer Type"
}
enum Section: Int {
    case profileDetails
    case awards
    case affiliations
    
    var sectionDescription: String {
        switch self {
        case .profileDetails:
            return "PROFILE DETAiLS"
        case .awards:
            return "AWARDS & CERTIFICATIONS"
        case .affiliations:
            return "AFFILIATIONS"
        }
    }
}
typealias RowData = (title: String, value: String?, isSecureEntry: Bool)
class ProfileDetailsViewModel {
    var dateFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
        return dateFormatter
    }()
    var profile: Profile
    
    var tableData = [[RowData]]()
    
    init(profile: Profile) {
        self.profile = profile
        buildTable()
    }
    
    private func buildTable() {
        buildProfileSection()
        buildAwardsSection()
        buildApplicationsSection()
    }
    
    private func buildProfileSection() {
        var rows = [RowData]()
        rows.append((ProfileDetails.firstname.rawValue, profile.firstname, false))
        rows.append((ProfileDetails.lastname.rawValue, profile.lastname, false))
        rows.append((ProfileDetails.birthdate.rawValue, dateOfBirth(profile.birthDate) ?? "dd/mm/yyyy", false))
        rows.append((ProfileDetails.city.rawValue, profile.gender ?? "Select Gender", false))
        profile.occupations.forEach{
            rows.append((ProfileDetails.occupation.rawValue, $0, false))
        }
        rows.append((ProfileDetails.occupation.rawValue, "Add Occupation", false))
        rows.append((ProfileDetails.photographerType.rawValue, profile.photographerType ?? "Select Type", false))
        tableData.append(rows)
    }
    
    private func buildAwardsSection() {
        var rows = [RowData]()
        profile.awards.forEach{
            rows.append(($0, nil, false))
        }
        rows.append(("Add One",nil, false))
        tableData.append(rows)
    }
    
    private func buildApplicationsSection() {
        var rows = [RowData]()
        profile.applications.forEach{
            rows.append(($0, nil, false))
        }
        rows.append(("Add One",nil, false))
        tableData.append(rows)
    }
    
    private func dateOfBirth(_ birthday: BirthDay?) -> String? {
        guard let birthday = birthday else {
            return nil
        }
        dateFormatter.dateFormat = "YYYYMMdd"
        guard let date = dateFormatter.date(from: birthday) else {
            return nil
        }
        dateFormatter.dateFormat = "MMM dd, YYYY"
        return dateFormatter.string(from: date)
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
