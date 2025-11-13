//
//  SignUpView.swift
//  Note
//
//  Created by Gideon Tobing on 12/11/2025.
//

import SwiftUI


struct SignUpView: View {
    
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var showingSheet: Bool = false
    @EnvironmentObject private var authModel : AuthViewModel
    
    var body: some View {
        
        NavigationStack {
            Form {
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
            }.navigationTitle("Welcome")
                .toolbar {
                    ToolbarItemGroup(placement: .cancellationAction) {
                        Button {
                            showingSheet.toggle()
                        } label: {
                            Text("Forgot Password?")
                        }
                        .sheet(isPresented: $showingSheet){
//                            ForgotPasswordView()
                        }
                    }
                }
        }
    }
}


#Preview {
    SignUpView()
}
