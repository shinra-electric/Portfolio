//
//  searchOSApp.swift
//  searchOS
//
//  Created by シェイミ on 22/06/2021.
//

import SwiftUI

@main
struct searchOSApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
