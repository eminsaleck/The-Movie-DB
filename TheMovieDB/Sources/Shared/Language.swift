//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

public enum Language: String, CaseIterable {
    case en
    case pl
    case ua
    
    
    public init?(languageStrings languages: [String]) {
        guard let preferedLanguage = languages.first,
              let language = Language.init(
                rawValue: String(preferedLanguage.prefix(2).lowercased())) else {
            return nil
        }
        
        self = language
    }
}
