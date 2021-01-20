//
//  Locations.swift
//  Trekr
//
//  Created by シェイミ on 20/01/2021.
//

import Foundation

// Define a class of locations that can be observed in the Environment. It defaults to Kyoto because why not...
class Locations: ObservableObject {
    let places: [Location]
    
    var primary: Location {
        places[9]
    }
    
    // This init could be dangerous with the crash operators, but in this case we know the data is there in the app bundle.
    // If the data wasn't there the app shouldn't try to continue anyway
    init() {
        let url = Bundle.main.url(forResource: "locations", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        places = try! JSONDecoder().decode([Location].self, from: data)
    }
}
