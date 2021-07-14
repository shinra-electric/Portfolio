//
//  CustomTabBar.swift
//  Carousel
//
//  Created by シェイミ on 13/07/2021.
//
// From Kavsoft: https://youtu.be/Wj_PJBWHWUc

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: String
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(title: "For You", image: "rectangle.portrait", currentTab: $currentTab)
            
            TabBarButton(title: "Search", image: "magnifyingglass", currentTab: $currentTab)
            
            TabBarButton(title: "Following", image: "bookmark", currentTab: $currentTab)
            
            TabBarButton(title: "Downloads", image: "square.and.arrow.down", currentTab: $currentTab)
        }
        .frame(height: 60)
        .background(.ultraThinMaterial)
        // Setting frame instead of using padding
        // This will help pad the bottom content for other tabs

    }
}


// Tab bar button
struct TabBarButton: View {
    var title: String
    var image: String
    @Binding var currentTab: String
    
    var body: some View {
        Button {
            withAnimation {
                currentTab = title
            }
            
        } label: {
            VStack(spacing: 5) {
                Image(systemName: image)
                    .font(.title2)
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundColor(title == currentTab ? .primary : .gray)
            // Maximum width
            .frame(maxWidth: .infinity)
        }
    }
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
