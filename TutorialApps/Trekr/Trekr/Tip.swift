//
//  Tip.swift
//  Trekr
//
//  Created by シェイミ on 20/01/2021.
//

import Foundation

struct Tip: Codable {
    let text: String
    let children: [Tip]?
    
}
