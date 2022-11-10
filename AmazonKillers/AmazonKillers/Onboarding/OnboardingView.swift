//
//  OnboardingView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 31.10.22.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var passedOnboarding: Bool
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeInOut) {
                            passedOnboarding = true
                            currentPage = 1
                            UserDefaultsManager.shared.storeBoolValue(true, key: .passOnboarding)
                        }
                    }, label: {
                        Text("Skip")
                            .foregroundColor(Color.white)
                            .padding(.trailing, 24)
                            .padding(.top, 15)
                    })
                }
                Spacer()
            }
            
            if currentPage == 1 {
                pageView(title: "Music collected\nespecially for you",
                         imageName: "music-folder",
                         groupName: "group1")
            }
            
            if currentPage == 2 {
                pageView(title: "Sound\nthat pleases",
                         imageName: "heart-circle",
                         groupName: "group2")
            }
            
            if currentPage == 3 {
                pageView(title: "Listen on any device\neven without internet",
                         imageName: "headphones",
                         groupName: "group3")
            }
            
            VStack {
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        if currentPage < 3 {
                            currentPage += 1
                        } else {
                            passedOnboarding = true
                            UserDefaultsManager.shared.storeBoolValue(true, key: .passOnboarding)
                            currentPage = 1
                        }
                    }
                }, label: {
                    Text("Next")
                        .foregroundColor(Color.white)
                        .frame(width: 131, height: 50)
                        .background(Color.red)
                        .cornerRadius(30.0)
                })
                .padding(.bottom, 25)
            }
        }
        .background(Color.background)
    }
    
    @ViewBuilder
    func pageView(title: String, imageName: String, groupName: String) -> some View {
        VStack {
            Spacer()
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()
            
            Text(title)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .font(.system(size: 28))
                .padding()
            
            Image(groupName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 56, height: 46)
                .padding()
            
            Spacer()
        }
    }
}
