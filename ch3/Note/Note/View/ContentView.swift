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
    
    var body: some View {
        NavigationStack {
            List(viewModel.notes, id: \.id) { note in
                NavigationLink(destination: DetailsView(note: note)) {
                    VStack(alignment: .leading) {
                        Text(note.title ?? "")
                            .font(.system(size: 22, weight: .regular))
                    }
                    .frame(maxHeight: 200)
                }
            }
            .onAppear(perform: self.viewModel.fetchData)
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
