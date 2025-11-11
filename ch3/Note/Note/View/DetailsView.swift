//
//  DetailsView.swift
//  Note
//
//  Created by Gideon Tobing on 11/11/2025.
//
import SwiftUI

struct DetailsView: View {
    var note: Note
    
    var body: some View {
            ScrollView {
                VStack {
                    Text("\(note.title ?? "")")
                        .font(.system(size: 22, weight: .regular))
                        .padding()
                    
                    Spacer()
                }
            }.navigationTitle("Details")
    }
}

#Preview {
    DetailsView(note: Note(id: "1", title: "Hello"))
}
