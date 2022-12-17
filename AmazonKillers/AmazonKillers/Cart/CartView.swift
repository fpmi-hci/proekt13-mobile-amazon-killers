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
    @State var showCheckout: Bool = false
    @State var count: String = "          1"
    
    var body: some View {
//        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Shopping Cart")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundColor(.textColor)
                        Text("1 item - Total 89 BYN")
                            .font(.system(size: 20))
                            .foregroundColor(.lightGray)
                    }.padding(.vertical)
                    Spacer()
                }.padding()
                
                HStack {
                    Image("car")
                    Text("Arrives by Dec 23 to Dec 27th")
                }                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 20, alignment: .center)
                    .padding(15)
                    .background(Color.accentYellow)
                    .cornerRadius(6)
                    .foregroundColor(Color.black)
                
                
                ForEach(cartData.indices, id: \.self) { indx in
                    let book = cartData[indx]
                    
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
                            Spacer()
                            HStack {
                                Text("Qty")
                                    .font(.title3)
                                    .foregroundColor(.textColor)
                                Spacer()
                                TextField("1", text: $count)
                                    .frame(maxWidth: 99, maxHeight: 36, alignment: .center)
                                    .border(Color.extraLightColor, width: 1.5)
                                    .cornerRadius(6.0)
                                    .padding(.bottom)
                            }
                            HStack {
                                Spacer()
                                Text("BYN 89")
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(.textColor)
                            }
                           
                        }.lineLimit(1)
                            .frame(width: 160, height: 170, alignment: .center)
                            .padding()
                        
                        
                    }//.frame(width: 160)
                    
                }.padding()
                
                Spacer()
                
                Button {
                    showCheckout.toggle()
                } label: {
                    Text("Checkout").font(.callout)
                        .bold()
                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 20, alignment: .center)
                        .padding(15)
                        .background(Color.accentRed)
                        .cornerRadius(6)
                        .foregroundColor(Color.white)
                }.fullScreenCover(isPresented: $showCheckout) {
                    CheckoutView()
                }

            }
//        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
