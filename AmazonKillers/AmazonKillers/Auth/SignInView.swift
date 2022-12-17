//
//  SignInView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 16.12.22.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var firebaseManager: FirebaseManager
    @State var showHomeView = false
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        VStack (alignment: .center) {
            VStack(alignment: .leading) {
                Text("Wellcome to Amazon Killers!")
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical)
                
                Text("Your e-mail")
                    .font(.title2)
                    .foregroundColor(.textColor)
                
                TextField("", text: $email)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .accentColor(.black)
                    .foregroundColor(.black)
                    .frame(maxWidth: 300, maxHeight: 50, alignment: .center)
                    .border(Color.lightGray, width: 2.0).cornerRadius(4.0)
                    .padding(.bottom)
                
                Text("Your password")
                    .font(.title2)
                    .foregroundColor(.textColor)
                
                SecureField("", text: $password)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .accentColor(.black)
                    .foregroundColor(.black)
                    .frame(maxWidth: 300, maxHeight: 50, alignment: .center)
                    .border(Color.lightGray, width: 2.0).cornerRadius(4.0)
                
                Button {
                    firebaseManager.sendResetPasswordLink(email: email)
                } label: {
                    Text("Forgot the password?")
                        .font(.title3)
                        .foregroundColor(Color.lightGray)
                        .padding(.vertical)
                }
            }
            
            Spacer()
            
            Button(action: {
                firebaseManager.signIn(email: email, password: password)
                self.showHomeView.toggle()
            }, label: {
                Text("Sign In")
                    .font(.title2)
                    .bold()
                    .frame(width: 300, height: 50, alignment: .center)
                    .padding(15)
                    .background(Color.accentRed)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
            }).padding()
            
            NavigationLink(isActive: $showHomeView,
                           destination: { AppView() },
                           label: { EmptyView() })
            
            HStack {
                Spacer()
                Text("Don't have an account?")
                    .font(.title2)
                    .foregroundColor(Color.textColor)
                
                NavigationLink {
                    SignUpView().navigationBarHidden(true)
                } label: {
                    Text("Sign Up")
                        .font(.title2)
                        .foregroundColor(Color.accentRed)
                }
                Spacer()
            }
            .padding(.bottom)
            
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
