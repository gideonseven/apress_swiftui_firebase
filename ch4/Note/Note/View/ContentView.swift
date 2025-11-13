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
    @StateObject private var viewModel = NoteViewModel()
    @ObservedObject private var authModel = AuthViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes, id:\.id) { Note in
                    NavigationLink(destination: DetailsView(note: Note)) {
                        VStack(alignment: .leading) {
                            Text(Note.title ?? "").font(.system(size: 22, weight: .regular))
                        }.frame(maxHeight: 200)
                    }
                }.onDelete(perform: self.viewModel.deleteData(at:))
            }.onAppear(perform: self.viewModel.fetchData)
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        HStack {
                            Text("\(viewModel.notes.count) notes")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                showingSheet.toggle()
                            } label: {
                                Image(systemName: "square.and.pencil")
                            }
                            .imageScale(.large)
                        }
                    }
                    ToolbarItemGroup(placement: .cancellationAction){
                        Button{
                            authModel.signOut()
                        } label: {
                            Text("Logout")
                        }
                    }
                }
                .sheet(isPresented: $showingSheet) {
                    FormView()
                        .presentationDetents([.large, .medium])
                }
        }
    }
}

#Preview {
    ContentView()
}
