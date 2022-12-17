//
//  FirebaseManager.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 16.12.22.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

class FirebaseManager: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    func signIn(email: String, password: String) {
        
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print("User not found")
                return
            }
            
            self.signedIn = true
            print("signed in")
            UserDefaultsManager.shared.storeBoolValue(true, key: .isLoggedIn)
            
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            
            print("signed up")
            UserDefaultsManager.shared.storeBoolValue(true, key: .isLoggedIn)
            self.signedIn = false
        }
    }
    
    func sendResetPasswordLink(email: String) {
        
        auth.sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("Check your email for link")
        }
    }
    
    func logOut() {
        
        UserDefaultsManager.shared.storeBoolValue(false, key: .isLoggedIn)
        
        DispatchQueue.main.async {
            self.signedIn = false
        }
    }
}
