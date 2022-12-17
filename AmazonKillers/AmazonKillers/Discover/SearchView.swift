//
//  SearchView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 16.12.22.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var selectedIndex: Int = 0
    @State var showDetails: Bool = false
    @State var searchText: String = ""
    var dataset = [Book]()
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: { }, label: {
                    HStack {
                        Image("search-icon")
                        
                        TextField("Search", text: $searchText).font(.system(size: 16))
                        
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
                    ForEach(bookData.indices, id: \.self) { indx in
                        let book = bookData[indx]
                        Button(action: {
                            selectedIndex = indx
                            showDetails.toggle()
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
                    .fullScreenCover(isPresented: $showDetails) {
                        DetailsView(selectedIndex: $selectedIndex)
                    }
                }
            }.padding()
            
            Spacer()
            
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }){
                Text("Back")
                    .font(.system(size: 16))
                    .foregroundColor(.accentRed)
            }
        }
    }
    mutating func filterDataBySearchRequest() {
        if !searchText.isEmpty {
            self.dataset = bookData.filter({ book in
                return (book.name.lowercased().contains(searchText.lowercased()))
            })
        }
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
