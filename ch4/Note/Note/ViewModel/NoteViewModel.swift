//
//  NoteViewModel.swift
//  Note
//
//  Created by Gideon Tobing on 11/11/2025.
//
import Foundation
import FirebaseFirestore
import FirebaseAuth
import Combine

class NoteViewModel: ObservableObject {
    @Published var notes = [Note]()
    
    private lazy var databaseReference: CollectionReference? = {
        guard let user = Auth.auth().currentUser?.uid else { return nil}
        let ref = Firestore.firestore().collection("Users").document(user).collection("Posts")
        return ref
    }()
    
    
    
    //function to post data
    func addData(title: String){
        do {
            _ = try databaseReference?.addDocument(data: ["title": title])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    
    //function to read data
    func fetchData() {
        databaseReference?.addSnapshotListener{
            (querySnapshot, error) in guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.notes = documents.compactMap{
                queryDocumentSnapshot -> Note? in return try? queryDocumentSnapshot.data(as: Note.self)
            }
        }
    }
    
    //function to update data
    func updateData(title: String, id: String) {
        databaseReference?.document(id).updateData(["title": title]){
            error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print ("Note updated successfully")
            }
        }
    }
    
    //function to delete data
    func deleteData(at indexSet: IndexSet){
        indexSet.forEach{ index in
            let note = notes[index]
            databaseReference?.document(note.id ?? "").delete{error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print ("Note with ID \(note.id ?? "") deleted")
                }
            }
        }
    }
}
