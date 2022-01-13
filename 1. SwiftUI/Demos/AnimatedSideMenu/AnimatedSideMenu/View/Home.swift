//
//  Home.swift
//  AnimatedSideMenu
//
//  Created by シェイミ on 19/11/2021.
//
// Demo by Kavsoft https://youtu.be/dYfnxYhkehs

import SwiftUI

struct Home: View {
    @State private var showMenu: Bool = false
    
    @State private var animatePath: Bool = false
    @State private var animateBG: Bool = false 
    
    var body: some View {
        ZStack {
            // Home View
            VStack(spacing: 15) {
                // Nav bar
                
                HStack {
                    Button {
                        
                        withAnimation {
                            animateBG.toggle()
                        }
                        
                        withAnimation(.spring()) {
                            showMenu.toggle()
                        }
                        
                        // Animate the Path with a slight delay
                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3).delay(0.2)) {
                            animatePath.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "text.alignleft")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .shadow(radius: 1 )
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .shadow(radius: 1 )
                    }
                }
                .overlay(
                    Text("Stories")
                        .font(.title2.bold())
                )
                .foregroundColor(Color.white.opacity(0.8))
                .padding([.horizontal, .top])
                .padding(.bottom, 5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 25) {
                        //Sample cards
                        ForEach(stories) { story in
                            // Card View
                            CardView(story: story)
                        }
                    }
                    .padding()
                    .padding(.top, 10)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                // Gradient
                LinearGradient(colors: [
                Color("BG1"),
                Color("BG2")
                ], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
            
            Color.black
                .opacity(animateBG ? 0.25 : 0)
                .ignoresSafeArea()
            
            MenuView(showMenu: $showMenu, animatePath: $animatePath, animateBG: $animateBG)
                .offset(x: showMenu ? 0 : -getRect().width)
        }
    }
    
    @ViewBuilder
    func CardView(story: Story) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            GeometryReader { proxy in
                
                let size = proxy.size
                
                Image(story.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(15)
            }
            .frame(height: 200)
            
            Text(story.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color.white.opacity(0.8))
            
            Button {
                
            } label: {
                Text("Read Now")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical, 6)
                    .padding(.horizontal)
                    .background(
                        Capsule()
                            .fill(Color("Red"))

                    )
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
