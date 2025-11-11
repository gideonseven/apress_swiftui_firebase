//
//  ContentView.swift
//  Note
//
//  Created by Gideon Tobing on 11/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @State private var postDetent = PresentationDetent.medium
    @ObservedObject private var viewModel = NoteViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                // TODO present our notes
                ForEach(viewModel.notes, id:\.id){
                    Note in VStack(alignment: .leading){
                        Text(Note.title ?? "").font(.system(size:22, weight: .regular))
                    }.frame(maxHeight: 200)
                }
                // fetch from firestore
            }.onAppear(perform: self.viewModel.fetchData)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar){
                        Text("\(viewModel.notes.count) notes")
                        Spacer()
                        Button {
                            // write a new note
                            showingSheet.toggle()
                        } label : {
                            Image(systemName: "square.and.pencil")
                        }
                        .imageScale(.large)
                        .sheet(isPresented: $showingSheet){
                            FormView().presentationDetents([.large, .medium])
                        }
                    }
                }
        }.navigationTitle("Notes")
    }
}

#Preview {
    ContentView()
}
