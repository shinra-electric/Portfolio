//
//  Serving.swift
//  CoolBeans
//
//  Created by シェイミ on 28/12/2021.
//

import Foundation

struct Serving: Identifiable, Codable, Equatable {
    var id: UUID
    let name: String
    let description: String
    let caffeine: Int
    let calories: Int
}
