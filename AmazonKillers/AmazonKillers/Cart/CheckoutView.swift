//
//  CheckoutView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 17.12.22.
//

import SwiftUI
import Kingfisher

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var selectedIndex: Int = 0
    @State var showConfirmation: Bool = false
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
                    
                    Text("Secure Payment")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(.textColor)
                    
                    Spacer()
                }.padding()
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Shipping")
                            .font(.system(size: 20))
                            .foregroundColor(.textColor)
                            .bold()
                            .padding(.horizontal)
                        Spacer()
                    }.padding(.horizontal)
                    
                }
                
                HStack {
                    Image("car")
                    Text("Add adress")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.accentRed)
                }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 20, alignment: .center)
                    .padding(15)
                    .background(Color.extraLightColor)
                    .cornerRadius(6)
                    .foregroundColor(Color.black)
                    .padding(.vertical)
                
                HStack { }.frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
                    .background(Color.extraLightColor)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Payment")
                            .font(.system(size: 20))
                            .foregroundColor(.textColor)
                            .bold()
                            .padding(.horizontal)
                        Spacer()
                    }.padding(.horizontal)
                        .padding(.top)
                    
                }
                
                VStack {
                    HStack{
                        Image("card")
                        Text("Add Credit / Debit Cards")
                        Spacer()
                    }.padding(.vertical)
                    
                    ZStack {
                        HStack{}.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 4.5, height: 50, alignment: .center)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(6)
                        TextField("  Card Holder’s Name", text: $name)
                            .disableAutocorrection(true)
                            .keyboardType(.default)
                            .autocapitalization(.none)
                            .accentColor(.black)
                            .foregroundColor(.black)
                            .frame(maxWidth: 400, maxHeight: 50, alignment: .center)
                            .padding(.bottom)
                    }
                    
                    ZStack {
                        HStack{}.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 4.5, height: 50, alignment: .center)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(6)
                        TextField("  Card Number", text: $number)
                            .disableAutocorrection(true)
                            .keyboardType(.default)
                            .autocapitalization(.none)
                            .accentColor(.black)
                            .foregroundColor(.black)
                            .frame(maxWidth: 400, maxHeight: 50, alignment: .center)
                            .padding(.bottom)
                    }
                    
                    HStack {
                        Text(" Expire Date").font(.subheadline)
                        Spacer()
                    }.padding(.top)
                    
                    HStack {
                        ZStack {
                            HStack{}.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 1.5, height: 50, alignment: .center)
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(6)
                            TextField("  Month", text: $month)
                                .disableAutocorrection(true)
                                .keyboardType(.default)
                                .autocapitalization(.none)
                                .accentColor(.black)
                                .foregroundColor(.black)
                                .frame(maxWidth: 200, maxHeight: 50, alignment: .center)
                                .padding(.bottom)
                        }
                        
                        ZStack {
                            HStack{}.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 1.5, height: 50, alignment: .center)
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(6)
                            TextField("  Year", text: $year)
                                .disableAutocorrection(true)
                                .keyboardType(.default)
                                .autocapitalization(.none)
                                .accentColor(.black)
                                .foregroundColor(.black)
                                .frame(maxWidth: 200, maxHeight: 50, alignment: .center)
                                .padding(.bottom)
                        }
                    }
                    
                    HStack {
                        ZStack {
                            HStack{}.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 1.5, height: 50, alignment: .center)
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(6)
                            SecureField("  Security Code", text: $code)
                                .disableAutocorrection(true)
                                .keyboardType(.default)
                                .autocapitalization(.none)
                                .accentColor(.black)
                                .foregroundColor(.black)
                                .frame(maxWidth: 200, maxHeight: 50, alignment: .center)
                                .padding(.bottom)
                        }
                        
                        ZStack {
                            HStack{}.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 1.5, height: 50, alignment: .center)
                                .padding(.horizontal)
                                .background(Color.extraLightColor)
                                .cornerRadius(6)
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 7, height: 420, alignment: .center)
                    .padding(.horizontal)
                    .background(Color.extraLightColor)
                    .cornerRadius(6)
                    .foregroundColor(Color.black)
                
                HStack { }.frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
                    .background(Color.extraLightColor)
                    .padding(.vertical)
                
                Spacer()
                
                HStack {
                    
                    VStack {
                        Text("Total cost")
                        Text("89 BYN")
                            .font(.system(size: 20))
                            .foregroundColor(.textColor)
                            .bold()
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    Button {
                        showConfirmation.toggle()
                    } label: {
                        Text("Pay Now")
                            .bold()
                            .frame(width: UIScreen.main.bounds.width - UIScreen.main.bounds.width / 1.5, height: 20, alignment: .center)
                            .padding(15)
                            .background(Color.accentRed)
                            .cornerRadius(6)
                            .foregroundColor(Color.white)
                    }.fullScreenCover(isPresented: $showConfirmation) {
                        ConfirmationView()
                    }
                }.padding(.horizontal)
               
                
            }
//        }
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
