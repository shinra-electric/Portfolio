//
//  Location.swift
//  Trekr
//
//  Created by シェイミ on 20/01/2021.
//

import Foundation

// Define the location struct
struct Location: Codable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    
    // This static example is great for using in Xcode previews. Being static, only one example is created that can be shared by all views.
    static let example = Location(id: 1, name: "Great Smokey Mountains", country: "US", description: "An interesting place", more: "Et cetera", latitude: 35.6532, longitude: -83.5070, heroPicture: "smokies", advisory: "Dangerous!")
}
