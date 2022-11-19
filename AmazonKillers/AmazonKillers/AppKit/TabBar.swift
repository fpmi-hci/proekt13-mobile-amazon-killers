//
//  TabBar.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 10.11.22.
//

import Foundation

import SwiftUI

struct TabBar: View {
    
    @Binding var selected : Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 80) {
            Button(action: {
                self.selected = 0
            }) {
                VStack {
                    if selected == 0 {
                        Image("home-selected")
                            .resizable()
                            .frame(width: 25, height: 25)
                    } else {
                        Image("home")
                            .resizable()
                            .frame(width: 25, height: 25)

                    }
                }
            }
            
            Button(action: {
                self.selected = 1
            }) {
                VStack {
                    if selected == 1 {
                        Image("cart-selected")
                            .resizable()
                            .frame(width: 25, height: 25)
                    } else {
                        Image("cart")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            
            Button(action: {
                self.selected = 2
            }) {
                VStack {
                    if selected == 2 {
                        Image("news-selected")
                            .resizable()
                            .frame(width: 25, height: 25)
                    } else {
                        Image("news")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            

            
            Button(action: {
                self.selected = 3
            }) {
                VStack {
                    if selected == 3 {
                        Image("account-selected")
                            .resizable()
                            .frame(width: 25, height: 25)
                    } else {
                        Image("account")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }
        .padding()
//        .cornerRadius(80)
//        .frame(width: UIScreen.main.bounds.width)
        .background(Color.background)
        .cornerRadius(80)
    }
}
