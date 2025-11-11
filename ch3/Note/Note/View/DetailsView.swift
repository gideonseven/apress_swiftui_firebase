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
        Text("\(note.title ?? "")")
    }
}

#Preview {
    DetailsView(note: Note(id: "1", title: "Hello"))
}
