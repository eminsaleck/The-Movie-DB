//
//  LocalizationHelper.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

enum Language: String {
  case english = "en"
  case ukrainian = "ua"
}

struct LocalizationHelper {

    static let defaultLanguage: Language = .english

  static func getCurrentLanguageCode() -> String {
    guard let languageCode = Locale.current.languageCode else {
      return defaultLanguage.rawValue
    }
    return Language.init(rawValue: languageCode)?.rawValue ?? defaultLanguage.rawValue
  }

}
