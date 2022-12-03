//
//  DetailsView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 29.11.22.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var selectedIndex: Int
    
    var body: some View {
            VStack {
                HStack {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }){
                        Image("back")
                    }
                    Spacer()
                    Image("save")
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        KFImage(URL(string: bookData[selectedIndex].cover))
                            .resizable()
                            .frame(width: 221, height: 338)
                            .cornerRadius(20)
                            .padding()
                        
                        Text(bookData[selectedIndex].name)
                            .font(.title2)
                            .foregroundColor(.textColor)
                            .bold()
                        
                        Text(bookData[selectedIndex].author)
                            .font(.title3)
                            .foregroundColor(.lightGray)
                        
                        HStack {
                            FiveStarView(rating: bookData[selectedIndex].rating)
                                .frame(width: 140,
                                       height: 20,
                                       alignment: .center)
                            
                            Text("4.0").font(.title2).foregroundColor(.textColor)
                        }
                        
                    }.padding()
                    
                    
                    VStack {
                        HStack {
                            Text("Overview")
                                .font(.title2)
                                .foregroundColor(.textColor)
                                .bold()
                            Spacer()
                        }.padding()
                        
                        Text(bookData[selectedIndex].overview)
                            .font(.title3)
                            .foregroundColor(.lightGray)
                            .padding(.horizontal)
                        
                    }
                }
                
                HStack {
                    Button(action: { }, label: {
                        Text("Read Reviews")
                            .font(.title2)
                            .bold()
                            .frame(width: 153, height: 55, alignment: .center)
                            .padding()
                            .background(Color.accentRed)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                    })
                    
                    Button(action: { }, label: {
                        Text("By for 14.05")
                            .font(.title2)
                            .bold()
                            .frame(width: 153, height: 55, alignment: .center)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                    })
                }
                
            }
    }
}
