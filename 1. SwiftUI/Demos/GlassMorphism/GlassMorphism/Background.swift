//
//  Background.swift
//  Background
//
//  Created by Xianmo on 16/08/2021.
//
// Kavsoft https://youtu.be/LbpGjAJRhLM

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(
        colors: [Color("BG1"), Color("BG2")],
        startPoint: .top,
        endPoint: .bottom)
            .ignoresSafeArea()
        
        // Glass Background
        GeometryReader { proxy in
            let size = proxy.size
            
            // Darken the background
            Color.black
                .opacity(0.7)
                .blur(radius: 200)
                .ignoresSafeArea()
            
            // Set some blurry coloured circles in the background
            Circle()
                .fill(Color("Purple"))
                .padding(50)
                .blur(radius: 120)
                .offset(x: -size.width / 1.8, y: -size.height / 5)
            
            Circle()
                .fill(Color("LightBlue"))
                .padding(50)
                .blur(radius: 150)
                .offset(x: size.width / 1.8, y: -size.height / 2)
            
            Circle()
                .fill(Color("LightBlue"))
                .padding(50)
                .blur(radius: 90)
                .offset(x: size.width / 1.8, y: size.height / 2)
            
            Circle()
                .fill(Color("Purple"))
                .padding(100)
                .blur(radius: 110)
                .offset(x: size.width / 1.8, y: size.height / 2)
            
            Circle()
                .fill(Color("Purple"))
                .padding(100)
                .blur(radius: 110)
                .offset(x: -size.width / 1.8, y: size.height / 2)
            
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
