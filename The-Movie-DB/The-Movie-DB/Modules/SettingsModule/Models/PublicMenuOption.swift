//
//  PublicMenuOption.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/4/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

enum PublicMenuOption: Int, MenuOption, CaseIterable {
    
    case about
    case ask
    case terms
    case privacy
    
    var description: String {
        switch self {
        case .about: return "About us"
        case .ask: return "Ask Us"
        case .terms: return "Terms & Conditions"
        case .privacy: return "Privacy Policy"
        }
    }
    
    var image: String {
        switch self {
        case .about: return "ic_about_filled"
        case .ask: return "ic_chat_filled"
        case .terms: return "ic_terms_filled"
        case .privacy: return "ic_privacy_filled"
        }
    }
}
