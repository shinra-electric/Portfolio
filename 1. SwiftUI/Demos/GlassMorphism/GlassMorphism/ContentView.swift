//
//  ContentView.swift
//  GlassMorphism
//
//  Created by Xianmo on 16/08/2021.
//
// Kavsoft https://youtu.be/LbpGjAJRhLM

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                
                Spacer(minLength: 10)
                
                // GlassMorphism card
                ZStack {
                    // Background balls
                    Circle()
                        .fill(Color("Purple"))
                        .blur(radius: 20)
                        .frame(width: 100, height: 100)
                        .offset(x: 120, y: -80)
                    
                    Circle()
                        .fill(Color("LightBlue"))
                        .blur(radius: 40)
                        .frame(width: 100, height: 100)
                        .offset(x: -120, y: 100)
                    
                    GlassCard()
                }
                
                Spacer(minLength: 10)
                
                Text("Did you ever wish\nit wasn't raining?")
                    .font(.system(size: UIScreen.main.bounds.height < 750 ? 30: 40, weight: .bold))
                
                Text(getAttributedString())
                    .fontWeight(.semibold)
                    .kerning(1.1)
                    .padding(.top, 10)
                
                Button {
                    
                } label: {
                    Text("Get Started")
                        .font(.title3.bold())
                        .padding(.vertical, 22)
                        .frame(maxWidth: .infinity)
                        .background(
                            .linearGradient(.init(colors: [
                                Color("Button1"),
                                Color("Button2")
                            
                            ]), startPoint: .leading, endPoint: .trailing)
                            , in: RoundedRectangle(cornerRadius: 20)
                        )
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 20)
                
                Button {
                    
                } label: {
                    Text("Already have an account?")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.bottom)
                
            }
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding()
            
        }
    }
    
    // Attributed Strings from iOS 15
    func getAttributedString() -> AttributedString {
        var attStr = AttributedString("Find out about our\ntravel packages")
        attStr.foregroundColor = .gray
        
        // Change only part of the string
        if let range = attStr.range(of: "travel packages") {
            attStr[range].foregroundColor = .white
        }
        
        return attStr
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
