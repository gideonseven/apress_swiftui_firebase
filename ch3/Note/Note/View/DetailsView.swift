//
//  DetailsView.swift
//  Note
//
//  Created by Gideon Tobing on 11/11/2025.
//
import SwiftUI

struct DetailsView: View {
    @State private var presentAlert = false
    @State private var titleText: String = ""
    @ObservedObject private var viewModel = NoteViewModel()
    var note: Note
    
    var body: some View {
            ScrollView {
                VStack {
                    Text("\(note.title ?? "")")
                        .font(.system(size: 22, weight: .regular))
                        .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("Details")
            .toolbar{
                ToolbarItemGroup(placement: .confirmationAction){
                    Button {
                        presentAlert = true
                    } label: {
                        Text ("Edit").bold()
                    }.alert("Note", isPresented: $presentAlert, actions: {
                        TextField("\(note.title ?? "")", text: $titleText)
                        Button("Update", action: {
                            //Update data and erase the text
                            self.viewModel.updateData(title: titleText, id: note.id ?? "")
                            titleText = ""
                        })
                        Button("Cancel", role: .cancel, action: {
                            presentAlert = false
                            titleText = ""
                        })
                    }, message: {
                        Text("Write your new note")
                    })
                }
            }
        
    }
}

#Preview {
    DetailsView(note: Note(id: "1", title: "Hello"))
}
