//
//  TrekrApp.swift
//  Trekr
//
//  Created by シェイミ on 20/01/2021.
//

import SwiftUI

@main
struct TrekrApp: App {
    // Instantiate the locations class here, so it can be used by all views.
    @StateObject var locations = Locations()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView(location: locations.primary)
                }
                .tabItem {
                    Label("Discover", systemImage: "airplane.circle.fill")
                }
                
                NavigationView {
                    WorldView()
                }
                .tabItem {
                    Label("Locations", systemImage: "star.fill")
                }
                
                NavigationView {
                    TipsView()
                }
                .tabItem {
                    Label("Tips", systemImage: "list.bullet")
                }
                
                
            }
            .environmentObject(locations)
        }
    }
}
