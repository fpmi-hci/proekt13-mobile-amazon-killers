//
//  ContentView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 31.10.22.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State var navigated = false
    @State var signedIn = true
    
    @State var selectedPage: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                if appViewModel.isLoggedIn {
                    mainContent
                } else {
                    if !appViewModel.passOnboarding {
                        OnboardingView(passedOnboarding: $appViewModel.passOnboarding)
                    } else {
                        NavigationView {
                            SignInView()
                        }
                    }
                }
            }
        }.navigationBarHidden(true)
            .transition(.opacity)
    }
    
    var mainContent: some View {
        VStack(spacing: 0) {
            appViews
                .environmentObject(appViewModel)
            
            TabBar(selected: $selectedPage)
        }
    }
    
    @ViewBuilder
    var appViews: some View {
        switch selectedPage {
        case 0:
            EmptyView()
            //            DiscoverView()
        default:
            EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

