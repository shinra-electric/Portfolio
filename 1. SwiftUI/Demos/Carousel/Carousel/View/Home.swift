//
//  Home.swift
//  Carousel
//
//  Created by シェイミ on 13/07/2021.
//
// From Kavsoft: https://youtu.be/Wj_PJBWHWUc

import SwiftUI

struct Home: View {
    @State private var currentTab = "For You"
    
    // Hiding standard Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection: $currentTab) {
            
            GeometryReader { proxy in
                let topEdge = proxy.safeAreaInsets.top
                ForYou(topEdge: topEdge)
                    .padding(.top, topEdge)
                    .ignoresSafeArea(.all, edges: .top)
            }
                .tag("For You")
            
            Text("Seach")
                .tag("Search")
            
            Text("Following")
                .tag("Following")
            
            Text("Downloads")
                .tag("Downloads")
        }
        .overlay(
            // Custom tab bar
            CustomTabBar(currentTab: $currentTab)
            ,alignment: .bottom
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
