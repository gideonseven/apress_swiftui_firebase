//
//  TabBarView.swift
//  socially
//
//  Created by gideon tobing on 14/11/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem{
                    Label("Feed", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    TabBarView()
}
