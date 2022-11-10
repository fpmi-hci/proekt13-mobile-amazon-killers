//
//  UserDefaultManager.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 31.10.22.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    private let storage = UserDefaults.standard
    
    func storeStringValue(_ value: String, key: UserDefaultsKey) {
        storage.set(value, forKey: key.rawValue)
    }
    
    func readStringValue(key: UserDefaultsKey) -> String? {
        storage.string(forKey: key.rawValue)
    }
    
    func storeBoolValue(_ value: Bool, key: UserDefaultsKey) {
        storage.set(value, forKey: key.rawValue)
    }
    
    func readBoolValue(key: UserDefaultsKey) -> Bool {
        storage.bool(forKey: key.rawValue)
    }
}

enum UserDefaultsKey: String {
    case isLoggedIn
    case passOnboarding
}
