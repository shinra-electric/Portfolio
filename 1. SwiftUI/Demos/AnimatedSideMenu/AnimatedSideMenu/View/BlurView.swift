//
//  BlurView.swift
//  AnimatedSideMenu
//
//  Created by シェイミ on 19/11/2021.
//
// Demo by Kavsoft https://youtu.be/dYfnxYhkehs

import SwiftUI

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    

}

