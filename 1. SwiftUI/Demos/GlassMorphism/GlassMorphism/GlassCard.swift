//
//  GlassCard.swift
//  GlassCard
//
//  Created by Xianmo on 16/08/2021.
//
// Kavsoft https://youtu.be/LbpGjAJRhLM

import SwiftUI

struct GlassCard: View {
    var body: some View {
        let width = UIScreen.main.bounds.width
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .opacity(0.1)
                .background(
                    Color.white
                        .opacity(0.08)
                        .blur(radius: 10)
                )
            
            // Strokes
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(
                            .linearGradient(.init(colors: [
                                Color("Purple"),
                                Color("Purple").opacity(0.5),
                                .clear,
                                .clear,
                                Color("LightBlue"),
                            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            , lineWidth: 2.5
                        )
                        .padding(2)
                )
            
            // Shadows
                .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
            
            // Content
            VStack {
                Image(systemName: "cloud.sun.rain")
                    .font(.system(size: 75, weight: .thin))
                
                Text("15")
                    .font(.system(size: 85, weight: .bold))
//                    .padding(.top, 2)
                    .overlay(
                        Text("°C")
                            .font(.title2)
                            .foregroundColor(.white.opacity(0.7))
                            .offset(x: 30, y: 15)
                        , alignment: .topTrailing
                    )
                    .offset(x: -6)
                
                Text("Dublin, Éire")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.4))
            }
            
        }
        .frame(width: width / 1.7, height: 270)

    }
}

struct GlassCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
