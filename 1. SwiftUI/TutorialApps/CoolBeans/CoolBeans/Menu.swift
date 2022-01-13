//
//  Menu.swift
//  CoolBeans
//
//  Created by シェイミ on 28/12/2021.
//

import Foundation
import UIKit

class Menu: ObservableObject, Codable {
    let sections: [MenuSection]
    var milkOptions = [ConfigurationOption.none]
    var syrupOptions = [ConfigurationOption.none]
    
    init() {
        do {
            let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
            let data = try Data(contentsOf: url)
            let menuData = try JSONDecoder().decode(Menu.self, from: data)
            
            sections = menuData.sections
            milkOptions.append(contentsOf: menuData.milkOptions)
            syrupOptions.append(contentsOf: menuData.syrupOptions)
        } catch {
            fatalError("menu.json is missing or corrupt.")
        }
    }
}

// Note: It's possible to use try! and so you wouldn't need the catch block.
// However, the catch block is generally preferable as it allows you to do something if there is a failure. 
