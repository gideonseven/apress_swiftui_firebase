//
//  PostView.swift
//  socially
//
//  Created by gideon tobing on 14/11/2025.
//

import SwiftUI

struct PostView: View {
    @State private var description: String = ""
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = PostViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Add a description", text: $description, axis: .vertical)
                        .lineLimit(6)
                }
                Section {
                    Button("Post"){
                        //MARK: post data to firestore
                        Task {
                            await self.viewModel.addData(description: description, datePublished: Date())
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Post")
            .toolbar{
                ToolbarItemGroup(placement: .cancellationAction){
                    Button("Cancel"){
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    PostView()
}
