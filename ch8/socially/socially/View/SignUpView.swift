//
//  SignUpView.swift
//  socially
//
//  Created by gideon tobing on 14/11/2025.
//

import SwiftUI
import AuthenticationServices
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    @ObservedObject private var authModel = AuthViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                // credit photo: https://unsplash.com/photos/e3OUQGT9bWU?utm_source=unsplash&utm_medium=referral&utm_content=creditShareLink
                Image("signup-picture")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 220)
                Text("Sign Up").font(.title2)
                    .bold()
                    .italic()
                    .padding(.bottom, 10)
                Text("Create your account to post your best content on Socially")
                    .font(.subheadline).multilineTextAlignment(.center)
                Spacer()
                Section {
                               TextField("Email", text: $emailAddress)
                                   .textContentType(.emailAddress)
                                   .keyboardType(.emailAddress)
                               SecureField("password", text: $password)
                           }
                           
                           Section {
                               Button(action: {
                                   // Sign up to firebase
                                   authModel.signUp(emailAddress: emailAddress, password: password)
                                   Analytics.logEvent("user_sign_up", parameters: nil)
                               }){
                                   Text("Sign Up").bold()
                               }
                           }
                           Section (header: Text("If you have already an account: ")){
                               Button(action: {
                                   // Sign In To Firebase
                                   authModel.signIn(emailAddress: emailAddress, password: password)
                               }){
                                   Text("Sign In")
                               }
                           }
            }
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    SignUpView()
}
