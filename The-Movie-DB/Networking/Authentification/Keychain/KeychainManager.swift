//
//  KeychainSwift.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//
import Foundation

@propertyWrapper
struct KeychainStorage {

    private let key: String
    private lazy var keychain = KeychainWrapper.standard

    init(key: String) {
        self.key = key
    }

    var wrappedValue: String? {
        mutating get {
            return keychain.string(forKey: key)
        }
        set {
            if let newValue = newValue {
                keychain.set(newValue, forKey: key)
            } else {
                keychain.removeObject(forKey: key)
            }
        }
    }

}
