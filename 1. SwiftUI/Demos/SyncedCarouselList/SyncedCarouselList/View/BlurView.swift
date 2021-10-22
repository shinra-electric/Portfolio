//
//  BlurView.swift
//  SyncedCarouselList
//
//  Created by Xianmo on 22/10/2021.
//
// Demo by Kavsoft https://youtu.be/8MrJwlvfGHQ
//

import SwiftUI


// This is only required for iOS 14. 
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}


