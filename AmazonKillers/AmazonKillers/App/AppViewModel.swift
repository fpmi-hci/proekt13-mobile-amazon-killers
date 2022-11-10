//
//  AppViewModel.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 31.10.22.
//

import Foundation

class AppViewModel: ObservableObject {
    @Published var isLoggedIn: Bool {
        willSet {
            UserDefaultsManager.shared.storeBoolValue(newValue, key: .isLoggedIn)
        }
    }
    
    @Published var passOnboarding: Bool {
        willSet {
            UserDefaultsManager.shared.storeBoolValue(newValue, key: .passOnboarding)
        }
    }
    
    init() {
        self._isLoggedIn = Published(initialValue: UserDefaultsManager.shared.readBoolValue(key: .isLoggedIn))
        self._passOnboarding = Published(initialValue: UserDefaultsManager.shared.readBoolValue(key: .passOnboarding))
    }
}
