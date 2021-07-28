//
//  OffsetModifier.swift
//  OffsetModifier
//
//  Created by シェイミ on 27/07/2021.
//
// From Kavsoft https://youtu.be/hmifqxD7seI

import SwiftUI


// Get Scrollview Offset
struct OffsetModifier: ViewModifier {
 
    @Binding var offset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { proxy -> Color in
                    
                    // Get value for coordinate space called SCROLL
                    let minY = proxy.frame(in: .named("SCROLL")).minY
                    
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    
                    return Color.clear
                }
                , alignment: .top
            )
    }
}
