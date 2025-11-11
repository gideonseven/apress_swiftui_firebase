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
    
    var body: some View {
        NavigationStack {
            List {
                // TODO present our notes
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar){
                    Text("X notes") // TODO
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
