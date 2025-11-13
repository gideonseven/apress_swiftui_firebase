//
//  Note.swift
//  Note
//
//  Created by Gideon Tobing on 11/11/2025.
//
import Foundation
import FirebaseFirestore

struct Note: Codable {
    @DocumentID var id: String?
    var title: String?
}
