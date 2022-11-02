//
//  Profile.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/25/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

// Date of birth in YYYYMMDD format
typealias BirthDay = String

struct Profile {
    var firstname: String?
    var lastname: String?
    var email: String
    var username: String
    var birthDate: BirthDay?
    var city: String?
    var gender: String?
    var occupations: [String]
    var photographerType: String?
    var awards: [String]
    var applications: [String]
}
