//
//  Scientist.swift
//  SpotTheScientist
//
//  Created by シェイミ on 10/02/2021.
//

import Foundation

struct Scientist: Decodable {
    let name: String
    let dates: String
    let field: String
    let bio: String
    let country: String
    let source: String
}
