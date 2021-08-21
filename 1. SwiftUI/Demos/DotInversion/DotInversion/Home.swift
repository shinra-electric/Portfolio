//
//  Home.swift
//  Home
//
//  Created by Xianmo on 20/08/2021.
//
// Kavsoft Demo: https://youtu.be/rqAi3D6Jt0Y

import SwiftUI

struct Home: View {
    @State private var dotState: DotState = .normal // Current state
    @State private var dotScale: CGFloat = 1    //Scale value
    
    @State private var dotRotation: Double = 0
    
    // To avoid multiple taps
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            
            ZStack {
                // Change the colour based on the dotState
                (dotState == .normal ? Color.mint : Color.pink)
                
                if dotState == .normal {    // Change view based on state
                    MinimisedView()
                } else {
                    ExpandedView()
                }
                
            }
            .animation(.none, value: dotState)
            
            Rectangle()
                .fill(dotState != .normal ? Color.mint : Color.pink)
                .overlay(
                    ZStack {
                        // Put view in reverse so that it appears like a masking effect
                        if dotState != .normal {    // Change view based on state
                            MinimisedView()
                        } else {
                            ExpandedView()
                        }
                    }
                )
                .animation(.none, value: dotState)
            
            // Mask the view with a circle to create the dot inversion animation
                .mask(
                    GeometryReader { proxy in
                        Circle()        // While increasing the scale, the content will be visible
                            .frame(width: 100, height: 100)
                            .scaleEffect(dotScale)
                            .rotation3DEffect(.init(degrees: dotRotation),
                                              axis: (x: 0, y: 1, z: 0),
                                              anchorZ: dotState == .flipped ? -10 : 10,
                                              perspective: 1)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                            .offset(y: -60)
                        
                    }
                
                )
            
            // Tap gesture
            Circle()
                .foregroundColor(.black.opacity(0.01))
                .frame(width: 100, height: 100)
                .overlay(       // Add arrows
                    Image(systemName: dotState == .normal ? "chevron.right" : "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                    // Opacity animation
                        .opacity(isAnimating ? 0 : 1)
                        .animation(.easeInOut(duration: 0.4), value: isAnimating)
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .onTapGesture(perform: {
                    if isAnimating { return }

                    isAnimating = true
                    
                    if dotState == .flipped {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.725) {
                            
                            withAnimation(.linear(duration: 0.7)) { // 1.5 / 2 = 0.7
                                dotScale = 1
                                dotState = .normal
                            }
                        }
                        
                        withAnimation(.linear(duration: 1.5)) {
                            dotRotation = 0
                            dotScale = 8
                        }

                    } else {
                        
                        // At a midpoint of 1.5 reset the scale to 1 agin so that it will appear like dot inversion.
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.725) {
                            
                            withAnimation(.linear(duration: 0.7)) { // 1.5 / 2 = 0.7
                                dotScale = 1
                                dotState = .flipped
                            }
                        }
                        
                        withAnimation(.linear(duration: 1.5)) {
                            dotRotation = -180
                            dotScale = 8
                        }
                    }
                    
                    // After 1.4 seconds reset isAnimating state
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                        isAnimating = false
                    }
                    
                })
                .offset(y: -60)
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func ExpandedView() -> some View {
        VStack(spacing: 10) {
            Image(systemName: "ipad")
                .font(.system(size: 148))
            
            Text("iPad")
                .font(.system(size: 38).bold())
        }
        .foregroundColor(.white)
    }
    
    @ViewBuilder
    func MinimisedView() -> some View {
        VStack(spacing: 10) {
            Image(systemName: "applewatch")
                .font(.system(size: 148))
            
            Text("Watch")
                .font(.system(size: 38).bold())
        }
        .foregroundColor(.white)
    }
}


// Enum for current dot state

enum DotState: Equatable {
    case normal
    case flipped
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
