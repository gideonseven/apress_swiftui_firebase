//
//  HolderView.swift
//  Note
//
//  Created by Gideon Tobing on 12/11/2025.
//

import SwiftUI

struct HolderView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    
    var body: some View {
        Group {
            if authModel.user == nil {
                SignUpView()
            }else {
                ContentView()
            }
        }
        .onAppear(){
            authModel.listenToAuthState()
        }
    }
}


#Preview {
    HolderView()
}
