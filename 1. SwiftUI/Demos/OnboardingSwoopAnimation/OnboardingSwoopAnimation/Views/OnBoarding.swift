//
//  OnBoarding.swift
//  OnBoarding
//
//  Created by Xianmo on 31/08/2021.

// Kavsoft demo https://youtu.be/rCgbJf5SWQE

import SwiftUI
import CoreGraphics

struct OnBoarding: View {
    @State private var offset: CGFloat = 0
    
    var body: some View {
        // Custom Pageing View
        OffsetPageTabView(offset: $offset) {
            HStack(spacing: 0) {
                ForEach(boardingScreens) { screen in
                    VStack(spacing: 15) {
                        Image(screen.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                        // The following tests for small screens
                            .scaleEffect(getScreenBounds().height < 750 ? 0.9 : 1)
                            .offset(y: getScreenBounds().height < 750 ? -100 :-120)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text(screen.title)
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                                .padding(.top, 20)
                            
                            Text(screen.description)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(y: -70)
                    }
                    .padding()
                    .frame(width: getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                }
            }

        }
        // Main background animation
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(.black.opacity(0.8))
            // Size the same as image size
                .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                .scaleEffect(2)
                .rotationEffect(.init(degrees: 25))
                .rotationEffect(.init(degrees: getRotation()))
                .offset(y: -getScreenBounds().width + 20)
            
            , alignment: .leading
        )
        .background(Color("screen\(getIndex() + 1)"))
        .animation(.easeInOut, value: getIndex())
        .ignoresSafeArea(.container, edges: .all)
        .overlay(
            VStack {
                //Bottom content
                HStack(spacing: 25) {
                    Button {
                        
                    } label: {
                        Text("Login")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Register")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .offset(x: -5)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    // Indicators
                    HStack(spacing: 8) {
                        ForEach(boardingScreens.indices, id: \.self) { index in
                            Circle()
                                .fill(.white)
                                .opacity(index == getIndex() ? 1 : 0.4)
                                .frame(width: 8, height: 8)
                                .scaleEffect(index == (getIndex()) ? 1.3 : 0.85)
                                .animation(.easeInOut, value: getIndex())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button {
                        // Set Max Offset
                        // Maximum of 4 screens, so max will be 3 * width
                        offset = min(offset + getScreenBounds().width, getScreenBounds().width * 3)
                        
                    } label: {
                        Text("Next")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    
                }
                .padding(.top, 30)
                .padding(.horizontal, 8)
            }
            .padding()
            , alignment: .bottom
        )
    }
    
    // Get rotation
    func getRotation() -> Double {
        let progress = offset / (getScreenBounds().width * 4)
        let rotation = Double(progress) * 360         // Do one full rotation (can also do less)
        
        return rotation
    }
    
    
    // Change the background colour based on the offset
    func getIndex() -> Int {
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }
}

// Extension of View to get screen bounds
extension View {
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}



struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
        //            .preferredColorScheme(.dark)
    }
}
