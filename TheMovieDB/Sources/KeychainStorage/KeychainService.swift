//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 04.03.2023.
//

import Foundation
import Security

final public class KeychainService {
    
    public var queryParametersOfLastOperation: [String: Any]?
    public var resultCodeOfLastOperation: OSStatus = noErr
    public var accessGroup: String?
    public var isSynchronizable = false
    
    private let queue = DispatchQueue(label: "com.keychainservice.serialqueue")
    
    public init() { }
    
    //MARK: - Public
    @discardableResult
    public func set(_ value: String, forKey key: String, withAccess access: CFString? = nil) -> Bool {
        return queue.sync {
            guard let valueData = value.data(using: .utf8) else { return false }
            return set(valueData, forKey: key, withAccess: access)
        }
    }
    
    public func getValue(_ key: String) -> String? {
        return queue.sync {
            guard let data = getData(key),
                  let currentString = String(data: data, encoding: .utf8) else {
                resultCodeOfLastOperation = -67853
                return nil
            }
            return currentString
        }
    }
    
    @discardableResult
    public func delete(_ key: String) -> Bool {
        var query = self.query(withKey: key)
        addAccessGroupWhenPresent(&query)
        addSynchronizableIfRequired(&query)
        
        queryParametersOfLastOperation = query
        resultCodeOfLastOperation = SecItemDelete(query as CFDictionary)
        
        return resultCodeOfLastOperation == errSecSuccess
    }
    
    @discardableResult
    public func clear() -> Bool {
        return queue.sync {
            var query: [String: Any] = [kSecClass as String: kSecClassGenericPassword]
            
            if let accessGroup = accessGroup {
                query[kSecAttrAccessGroup as String] = accessGroup
            }
            
            if isSynchronizable {
                query[kSecAttrSynchronizable as String] = kCFBooleanTrue
            }
            
            queryParametersOfLastOperation = query
            resultCodeOfLastOperation = SecItemDelete(query as CFDictionary)
            
            return resultCodeOfLastOperation == noErr
        }
    }
    
    //MARK: - Private
    private func query(withKey key: String) -> [String: Any] {
        var query: [String: Any] = [
            kSecClass as String      : kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup
        }
        
        if isSynchronizable {
            query[kSecAttrSynchronizable as String] = kCFBooleanTrue
        }
        
        return query
    }
    
    private func addAccessGroupWhenPresent(_ query: inout [String: Any]) {
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup
        }
    }
    
    private func addSynchronizableIfRequired(_ query: inout [String: Any]) {
        if isSynchronizable {
            query[kSecAttrSynchronizable as String] = kCFBooleanTrue
        }
    }
    
    private func getData(_ key: String) -> Data? {
        var query = query(withKey: key)
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        addAccessGroupWhenPresent(&query)
        addSynchronizableIfRequired(&query)
        
        queryParametersOfLastOperation = query
        var result: AnyObject?
        resultCodeOfLastOperation = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        return resultCodeOfLastOperation == noErr ? result as? Data : nil
    }
    
    private func set(_ value: Data, forKey key: String, withAccess access: CFString? = nil) -> Bool {
            delete(key)
            
            let accessible = access ?? kSecAttrAccessibleWhenUnlocked
            var query = query(withKey: key)
            query[kSecValueData as String] = value
            query[kSecAttrAccessible as String] = accessible
            addAccessGroupWhenPresent(&query)
            addSynchronizableIfRequired(&query)
            
            queryParametersOfLastOperation = query
            resultCodeOfLastOperation = SecItemAdd(query as CFDictionary, nil)
            
            return resultCodeOfLastOperation == noErr
    }
}
