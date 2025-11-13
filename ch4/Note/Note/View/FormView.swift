//
//  FormView.swift
//  Note
//
//  Created by Gideon Tobing on 11/11/2025.
//

import SwiftUI

struct FormView: View {
    @Environment(\.dismiss) var dismiss
    @State var titleText = ""
    @ObservedObject private var viewModel = NoteViewModel()
    
    var body: some View {
        // ...
        NavigationStack {
            Form {
                Section {
                    TextEditor(text: $titleText)
                        .frame(minHeight: 200)
                }
                Section {
                    Button(action: {
                        //TODO : upload data
                        self.viewModel.addData(title: titleText)
                        titleText = ""
                        dismiss()
                    }){
                        Text("Save Now")
                    }.disabled(self.titleText.isEmpty)
                        .foregroundColor(.yellow)
                }
            }.navigationTitle("Publish")
                .toolbar {
                    ToolbarItemGroup(placement: .destructiveAction){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    FormView()
}
