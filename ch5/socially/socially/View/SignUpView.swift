//
//  SignUpView.swift
//  socially
//
//  Created by gideon tobing on 14/11/2025.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center){
                // credit
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
                // TODO: Sign In With Apple button
            }
        }
    }
}


#Preview {
    SignUpView()
}
