//
//  MenuSection.swift
//  CoolBeans
//
//  Created by シェイミ on 28/12/2021.
//

import Foundation

struct MenuSection: Identifiable, Codable {
    let id: UUID
    let name: String
    let drinks: [Drink]
    
    func matches(for search: String) -> [Drink] {
        let trimmed = search.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty { return drinks }
        
        return drinks.filter { $0.name.localizedCaseInsensitiveContains(trimmed) }
    }
    
}
