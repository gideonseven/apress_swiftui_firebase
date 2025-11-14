//
//  PostViewModel.swift
//  socially
//
//  Created by gideon tobing on 14/11/2025.
//

import SwiftUI
import FirebaseFirestore
import Combine

class PostViewModel: ObservableObject {
    @Published var  posts = [Post]()
    private var databaseReference = Firestore.firestore().collection("Posts")
    
    // Function to post data
    func addData(description: String, datePublished: Date) async {
        do {
            _ = try await databaseReference.addDocument(data: ["description": description, "datePublished": datePublished])
        } catch {
            print(error.localizedDescription)
        }
    }
}
