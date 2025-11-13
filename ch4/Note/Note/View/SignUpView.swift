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
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    TextField("Email", text: $emailAddress)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                    SecureField("password", text: $password)
                }
            }
        }
    }
}


#Preview {
    SignUpView()
}
