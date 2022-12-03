//
//  CartView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 29.11.22.
//

import SwiftUI
import Kingfisher

struct CartView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Shopping Cart")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundColor(.textColor)
                        Text("2 items - Total 147,45 BYN")
                            .font(.system(size: 20))
                            .foregroundColor(.lightGray)
                    }
                    Spacer()
                }.padding()
                
                HStack {
                    Image("car")
                    Text("Arrives by Nov 3 to Nov 9th")
                }                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 20, alignment: .center)
                    .padding(15)
                    .background(Color.accentYellow)
                    .cornerRadius(6)
                    .foregroundColor(Color.black)
                
                
                ForEach(bookData.indices, id: \.self) { indx in
                    let book = bookData[indx]
                    
                    HStack {
                        KFImage(URL(string: book.cover))
                            .resizable()
                            .frame(width: 160, height: 250)
                            .cornerRadius(20)
                        
//                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text(book.name)
                                .font(.subheadline)
                                .foregroundColor(.textColor)
                                .bold()
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.lightGray)
                            
                        }.lineLimit(1)
                            .frame(width: 160, height: 170, alignment: .leading)
                            .padding()
                        
                        
                    }//.frame(width: 160)
                    
                }.padding()
            }
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
