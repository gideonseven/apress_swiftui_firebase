//
//  NoteViewModel.swift
//  Note
//
//  Created by Gideon Tobing on 11/11/2025.
//
import Foundation
import FirebaseFirestore
import Combine

class NoteViewModel: ObservableObject {
    @Published var notes = [Note]()
    
    private var databaseReference = Firestore.firestore().collection("Notes")
    
    //function to post data
    func addData(title: String){
        do {
            _ = try databaseReference.addDocument(data: ["title": title])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    
    //function to read data
    
    //function to update data
    
    //function to delete data
}
