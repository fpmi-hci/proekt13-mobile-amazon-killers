//
//  AmazonKillersApp.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 31.10.22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct AmazonKillersApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var appViewModel: AppViewModel
    @StateObject var firebaseManager: FirebaseManager
    
    init() {
        self._firebaseManager = StateObject(wrappedValue: FirebaseManager())
        self._appViewModel = StateObject(wrappedValue: AppViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(firebaseManager)
                .environmentObject(appViewModel)
        }
    }
}
