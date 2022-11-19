//
//  DiscoverView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 11.11.22.
//

import SwiftUI
import Kingfisher

struct DiscoverView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { value in
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Welcome back, Bunny!")
                                    .font(.system(size: 20))
                                    .foregroundColor(.lightGray)
                                Text("What do you want to read today?")
                                    .font(.system(size: 30, weight: .semibold))
                                    .foregroundColor(.textColor)
                            }
                            Spacer()
                        }.padding()
                        
                        ZStack {
                            Button(action: { }, label: {
                                HStack {
                                    Image("search-icon")
                                    
                                    Text("Search").font(.system(size: 16))
                                    
                                    Spacer()
                                    
                                    Image("mic-icon")
                                }
                                .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 20, alignment: .center)
                                .padding(15)
                                .background(Color.extraLightColor)
                                .cornerRadius(10)
                                .foregroundColor(Color.lightGray)
                            })
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 25) {
                                ForEach(data.indices, id: \.self) { indx in
                                    let category = data[indx]
                                    Button(action: {
//                                        selectedIndex = indx
                                        value.scrollTo(indx)
                                    }) {
                                        VStack {
                                            Text(category)
                                                .font(.system(size: 18))
                                                .foregroundColor(.lightGray)
                                        }
                                    }
                                }
                            }.padding()
                        }
                        
                        //                ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                            ForEach(data.indices, id: \.self) { i in
                                let category = data[i]
                                
                                HStack {
                                    Text(category)
                                        .foregroundColor(.textColor)
                                        .font(.system(size: 26, weight: .bold))
                                        
                                    Spacer()
                                }
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 25) {
                                        ForEach(bookData.indices, id: \.self) { indx in
                                            let book = bookData[indx]
                                            Button(action: {
                                                selectedIndex = indx
                                                //                                    showDetails.toggle()
                                            }) {
                                                VStack {
                                                    KFImage(URL(string: book.cover))
                                                        .resizable()
                                                        .frame(width: 160, height: 250)
                                                        .cornerRadius(20)
                                                    HStack {
                                                        VStack(alignment: .leading) {
                                                            Text(book.name)
                                                                .font(.subheadline)
                                                                .foregroundColor(.textColor)
                                                                .bold()
                                                            Text(book.author)
                                                                .font(.subheadline)
                                                                .foregroundColor(.lightGray)
                                                        }.lineLimit(1)
                                                        Spacer()
                                                    }
                                                }.frame(width: 160)
                                            }
                                        }
                                        //                            .fullScreenCover(isPresented: $showDetails) {
                                        //                                AlbumDetailsView(albums: $albums, selectedIndex: $selectedIndex)
                                    }
                                }.id(i)
                            }
                            
                            
                        }.padding()
                        
                        //                }
                    }
                    
                }
            }
            //            Spacer()
        }
        
        
    }
    
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
