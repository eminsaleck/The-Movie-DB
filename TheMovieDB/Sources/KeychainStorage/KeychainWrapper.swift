//
//  KeychainStorage.swift
//  UpcomingMoviesData
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//


import Foundation

@propertyWrapper
public struct KeychainWrapper {
    
    private let key: String
    private lazy var keychain = KeychainService()
    
    init(key: String) {
        self.key = key
    }
    
    public var wrappedValue: String? {
        mutating get {
            return keychain.getValue(key)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: key)
            } else {
                keychain.delete(key)
            }
        }
    }
}
