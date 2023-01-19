//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Shared

func localizeKey(_ key: String, _ locale: Locale) -> String {
  guard let bundle = buildBundleForLocalization(locale) else {
    return ""
  }
  return bundle.localizedString(forKey: key, value: nil, table: nil)
}

private func buildBundleForLocalization(_ locale: Locale) -> Bundle? {
  guard let pathBundle = Bundle.module.path(forResource: lprojFileNameForLanguageCode(locale), ofType: "lproj") else {
    return nil
  }
  return Bundle(path: pathBundle)
}

private func lprojFileNameForLanguageCode(_ locale: Locale) -> String {
  return Language(rawValue: locale.languageCode ?? "en")?.rawValue ?? "en"
}

