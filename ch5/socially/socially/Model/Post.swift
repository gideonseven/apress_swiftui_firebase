//
//  Post.swift
//  socially
//
//  Created by gideon tobing on 14/11/2025.
//

import SwiftUI
import FirebaseFirestore

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    var description: String?
    var imageURL: String?
    @ServerTimestamp var datePublished: Date?
}
