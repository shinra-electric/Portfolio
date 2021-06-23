//
//  macOSModel.swift
//  Search
//
//  Created by シェイミ on 21/06/2021.
//

import Foundation

struct MacOSModel: Codable, Hashable {
    var codename: String
    var version: String
    var releaseDate: String
    var icon: String
    var background: String
    var architecture: String
    var applications: String
    var isFavorite: Bool? = false
    
    
}


let example = MacOSModel(
    codename: "Monterey",
    version: "12",
    releaseDate: "2021",
    icon: "monterey",
    background: "monterey_background",
    architecture: "Intel/ARM",
    applications: "64-bit",
    isFavorite: true
    )

