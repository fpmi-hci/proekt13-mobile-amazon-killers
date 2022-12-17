//
//  ConfirmationView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 17.12.22.
//

import SwiftUI
import Kingfisher

struct ConfirmationView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var selectedIndex: Int = 0
    @State var showHome: Bool = false
    @State var name = ""
    @State var number = ""
    @State var month = ""
    @State var year = ""
    @State var code = ""
    
    var body: some View {
        //        ScrollView {
        VStack {
            HStack {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }){
                    Image("back")
                        .padding(.horizontal)
                }
                
                Spacer()
                
                Text("Order Confirmation")
                    .font(.system(size: 30, weight: .semibold))
                    .foregroundColor(.textColor)
                
                Spacer()
            }.padding()
            
            
                HStack {
                    Image("confirmation")
                        .resizable()
                        .frame(width: 62, height: 60, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("Thank you!")
                            .font(.system(size: 20))
                            .foregroundColor(.textColor)
                            .bold()
                        Text("Your order #BE12345 has been placed.")
                    }
                    
                    Spacer()
                }.padding(.horizontal)
            
            VStack(alignment: .leading) {
                Text("We sent an email to adambokun@gmail.com with your order confirmation and bill.")
            }.padding()
            
            HStack {
                Image("car")
                Text("Arrives by Dec 23 to Dec 27th")
            }                        .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 20, alignment: .center)
                .padding(15)
                .background(Color.accentYellow)
                .cornerRadius(6)
                .foregroundColor(Color.black)

         

            
            Spacer()
            
            Button {
                showHome.toggle()
            } label: {
                Text("Back to Shopping").font(.callout)
                    .bold()
                    .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 20, alignment: .center)
                    .padding(15)
                    .background(Color.accentRed)
                    .cornerRadius(6)
                    .foregroundColor(Color.white)
            }.fullScreenCover(isPresented: $showHome) {
                AppView()
            }
            
            
        }
        //        }
        
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
