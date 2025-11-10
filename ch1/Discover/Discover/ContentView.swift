//
//  ContentView.swift
//  Discover
//
//  Created by Gideon Tobing on 10/11/2025.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID()
    var title : String
    var coordinate: CLLocationCoordinate2D
    var architecte: String
}

struct ContentView: View {
    private let initialRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    
    let annotations: [Place] = [
        .init(title: "Fontana di Trevi", coordinate: .init(latitude: 41.900833, longitude: 12.483056), architecte: "Nicola Salvi"),
        .init(title: "Pantheon",        coordinate: .init(latitude: 41.8986,   longitude: 12.4768),   architecte: "Marcus Agrippa"),
        .init(title: "Villa Medici",    coordinate: .init(latitude: 41.908,     longitude: 12.483),    architecte: "Bartolomeo Ammannati"),
        .init(title: "Colosseo",        coordinate: .init(latitude: 41.890278,  longitude: 12.492222), architecte: "Flavian Emperors")
    ]
    
    var body: some View {
        Map(initialPosition: .region(initialRegion)) {
            ForEach(annotations) { place in
                Marker(place.title, coordinate: place.coordinate) // replaces MapMarker
            }
        }
    }
}


#Preview {
    ContentView()
}
