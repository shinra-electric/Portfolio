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
}


let example = MacOSModel(
    codename: "Monterey",
    version: "12",
    releaseDate: "2021",
    icon: "monterey",
    background: "monterey_background"
    )

