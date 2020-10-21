//
//  ContentView.swift
//  ExpandingLists
//
//  Created by シェイミ on 04/09/2020.
//

import SwiftUI

struct Computers: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Computers]?
}

struct ContentView: View {
    let items: [Computers] = [.example1, .example2, .example3]
    
    var body: some View {
        List(items, children: \.items) { row in
            Image(systemName: row.icon)
            Text(row.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



extension Computers {
    // example computer companies
    static let apple = Computers(name: "Apple", icon: "applelogo")
    static let ibm = Computers(name: "IBM", icon: "square.and.pencil")
    static let dell = Computers(name: "Dell", icon: "bolt.fill")
    static let commodore = Computers(name: "Commodore", icon: "mic")
    
    //some example groups
    static let example1 = Computers(name: "Favourites", icon: "star", items: [Computers.apple, Computers.ibm, Computers.commodore, Computers.dell])
    static let example2 = Computers(name: "Recent", icon: "timer", items: [Computers.apple, Computers.ibm, Computers.commodore, Computers.dell])
    static let example3 = Computers(name: "Recommended", icon: "hand.thumbsup", items: [Computers.apple, Computers.ibm, Computers.commodore, Computers.dell])
}
