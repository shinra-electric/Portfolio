//
//  Home.swift
//  AnimatedElasticTabBar
//
//  Created by シェイミ on 13/01/2022.
//

import SwiftUI

struct Home: View {
    @State private var currentTab: Tab = .home
    
    // Get screen size and bottom safe area
    var size: CGSize
    var bottomEdge: CGFloat
    
    // Hiding native tab
    init(size: CGSize, bottomEdge: CGFloat) {
        self.size = size
        self.bottomEdge = bottomEdge
        UITabBar.appearance().isHidden = true
    }
    
    // For matched geometry effect
    @Namespace var animation
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // Native Tab View
            TabView(selection: $currentTab) {
                Text("Home")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(Tab.home)
                Text("Search")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(Tab.search)
                Text("Liked")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(Tab.liked)
                Text("Settings")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.04).ignoresSafeArea())
                    .tag(Tab.settings)
            }
            
            // Custom Tab View
            CustomTabView(animation: animation, currentTab: $currentTab,  size: size, bottomEdge: bottomEdge)
                .background(.white)
        }
        
        
    }
}

enum Tab: String , CaseIterable {
    case home = "house.fill"
    case search = "magnifyingglass"
    case liked = "suit.heart.fill"
    case settings = "gearshape"
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
