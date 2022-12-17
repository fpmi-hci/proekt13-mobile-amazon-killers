//
//  SignUpView.swift
//  AmazonKillers
//
//  Created by Adam Bokun on 16.12.22.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var firebaseManager: FirebaseManager
    var showHomeView = false
    @State var email = ""
    @State var name = ""
    @State var username = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    
    var body: some View {
        VStack (alignment: .center) {
            VStack(alignment: .leading) {
                Text("Create new account!")
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
                
                Text("Your name")
                    .font(.title2)
                    .foregroundColor(.textColor)
                
                TextField("", text: $name)
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
                    .padding(.bottom)
                
                Text("Confirm your password")
                    .font(.title2)
                    .foregroundColor(.textColor)
                
                SecureField("", text: $confirmPassword)
                    .disableAutocorrection(true)
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .accentColor(.black)
                    .foregroundColor(.black)
                    .frame(maxWidth: 300, maxHeight: 50, alignment: .center)
                    .border(Color.lightGray, width: 2.0).cornerRadius(4.0)
            }
            
            Spacer()
            
            Button(action: {
                firebaseManager.signUp(email: email, password: password)
            }, label: {
                Text("Sign Up")
                    .font(.title2)
                    .bold()
                    .frame(width: 300, height: 50, alignment: .center)
                    .padding(15)
                    .background(Color.accentRed)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
            }).padding()
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
