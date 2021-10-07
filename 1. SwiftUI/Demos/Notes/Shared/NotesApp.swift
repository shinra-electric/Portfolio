//
//  NotesApp.swift
//  Shared
//
//  Created by Xianmo on 07/10/2021.
//

import SwiftUI

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // Hide the Titlebar
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
