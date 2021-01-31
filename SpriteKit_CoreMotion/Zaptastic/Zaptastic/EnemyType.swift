//
//  EnemyType.swift
//  Zaptastic
//
//  Created by シェイミ on 20/01/2021.
//

import SpriteKit

// Speeds in SpriteKit are stored as CGFLoat
struct EnemyType: Codable {
    let name: String
    let shields: Int
    let speed: CGFloat
    let powerUpChance: Int
}
