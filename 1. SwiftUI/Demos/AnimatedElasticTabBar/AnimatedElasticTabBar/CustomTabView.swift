//
//  CustomTabView.swift
//  AnimatedElasticTabBar
//
//  Created by シェイミ on 13/01/2022.
//

import SwiftUI
import CoreGraphics

struct CustomTabView: View {
    var animation: Namespace.ID
    @Binding var currentTab: Tab
    
    // Get screen size and bottom safe area
    var size: CGSize
    var bottomEdge: CGFloat
    
    // Adding animation
    @State private var startAnimation: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            
            // Tab Buttons
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                
                TabButtons(tab: tab, animation: animation, currentTab: $currentTab) { pressedTab in
                    //Updating tab
                    withAnimation(.spring()) {
                       startAnimation = true
                    }
                    
                    // Start tab animation after a delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8))  {
                           currentTab = pressedTab
                        }
                    }
                    
                    // after animation finishes reset main animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                           startAnimation = false
                        }
                    }
                }
                
            }
        }
        // Custom elastic shape
        .background(
            ZStack {
                let animationOffset: CGFloat = (startAnimation ? (startAnimation ? 15 : 18) : (bottomEdge == 0 ? 26 : 27))
                // This offset accounts for smaller screen sizes if bottom edge is 0
                let offset: CGSize = bottomEdge == 0 ?
                    CGSize(width: animationOffset, height: 31) :
                    CGSize(width: animationOffset, height: 36)
                
                
                Rectangle()
                    .fill(.purple)
                    .frame(width: 45, height: 45) //Same size as buttons
                    .offset(y: 40)
                
                // Add two circles to createh the elastic shape
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45) //Same size as buttons
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1) // To account for smaller screen sizes
                    .offset(x: offset.width, y: offset.height)
                
                Circle()
                    .fill(.white)
                    .frame(width: 45, height: 45) //Same size as buttons
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1) // To account for smaller screen sizes
                    .offset(x: -offset.width, y: offset.height)
                
            }
            .offset(x: getStartOffset())
                .offset(x: getOffset())
            // Move to start
            , alignment: .leading
        
        )
        .padding(.horizontal, 15)
        .padding(.top, 7)
        .padding(.bottom, bottomEdge == 0 ? 23 : bottomEdge)
    }
    
    // Get start offset
    func getStartOffset() -> CGFloat {
        // padding
        let reduced = (size.width - 30) / 4
        let centre = (reduced - 45) / 2     // 45 is the button size
        return centre
    }
    
    // Moving the elastic shape
    func getOffset() -> CGFloat {
        let reduced = (size.width - 30) / 4
        // get index and multiply by that
        let index = Tab.allCases.firstIndex { checkTab in
            return checkTab == currentTab
        } ?? 0
        
        return reduced * CGFloat(index)
    }
 }

struct TabButtons: View {
    var tab: Tab
    var animation: Namespace.ID
    @Binding var currentTab: Tab
    
    // Send back the result
    var onTap: (Tab) -> ()
    
    var body: some View {
        
        // We don't need the ripple effect when tapping, so use onTap.
        Image(systemName: tab.rawValue)
            .foregroundColor(currentTab == tab ? .white : .gray)
            .frame(width: 45, height: 45)
            .background(
                // Use Matched Geometry Circle
                ZStack {
                    if currentTab == tab {
                        Circle()
                            .fill(.purple)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            
            )
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle()) //This makes the hit box bigger
            .onTapGesture {
                if currentTab != tab {
                    onTap(tab)
                }
            }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
