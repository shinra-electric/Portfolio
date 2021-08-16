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
    var latestVersion: String
    var releaseDate: String
    var icon: String
    var background: String
    var architecture: Architecture
    var applications: Applications
    
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


// This example is for previews
let example = MacOSModel(
    codename: "Monterey",
    id: "12",
    latestVersion: "12.0 Beta 5",
    releaseDate: "2021",
    icon: "monterey",
    background: "monterey_background",
    architecture: MacOSModel.Architecture.intelArm,
    applications: MacOSModel.Applications.sixtyFourBit
    )


