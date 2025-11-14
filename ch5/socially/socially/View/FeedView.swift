//
//  FeedView.swift
//  socially
//
//  Created by gideon tobing on 14/11/2025.
//

import SwiftUI
import FirebaseFirestore

struct FeedView: View {
    @State private var showSheet: Bool = false
    @FirestoreQuery(collectionPath: "Posts")
    var posts: [Post]
    var body: some View {
        NavigationStack {
            List(posts){ posts in
                
                VStack(alignment: .leading){
                    VStack {
                        Text(posts.description ?? "")
                            .font(.headline)
                            .padding(12)
                        Text("Published on the \(posts.datePublished?.formatted() ?? "")")
                            .font(.caption)
                    }
                }.frame(minHeight: 100, maxHeight: 350)
            }.listStyle(GroupedListStyle())
                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
                        Button{
                            showSheet.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .imageScale(.large)
                        }.sheet(isPresented: $showSheet){
                            PostView()
                        }
                    }
                }
        }
    }
}
    
#Preview {
   FeedView()
}
