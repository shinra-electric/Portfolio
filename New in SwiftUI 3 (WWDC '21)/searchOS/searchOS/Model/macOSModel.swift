//
//  macOSModel.swift
//  Search
//
//  Created by シェイミ on 21/06/2021.
//

import Foundation

struct MacOSModel: Codable, Hashable, Identifiable {
    var codename: String
    var id: String
    var releaseDate: String
    var icon: String
    var background: String
    var architecture: Architecture
    var applications: Applications
    var isFavourite: Bool = false
    
    enum Architecture: String, CaseIterable, Codable {
        case ppc = "PowerPC"
        case ppcIntel = "PowerPC/Intel"
        case intel = "Intel"
        case intelArm = "Intel/ARM"
        case arm = "ARM"
    }
    
    enum Applications: String, CaseIterable, Codable {
        case thirtyTwoBit = "32-bit"
        case thirtyTwoAnd64Bit = "32-bit/64-bit"
        case sixtyFourBit = "64-bit"
    }
}


let example = MacOSModel(
    codename: "Monterey",
    id: "12",
    releaseDate: "2021",
    icon: "monterey",
    background: "monterey_background",
    architecture: MacOSModel.Architecture.intelArm,
    applications: MacOSModel.Applications.sixtyFourBit,
    isFavourite: true
    )


