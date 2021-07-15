//
//  VerticalCarouselList.swift
//  Carousel
//
//  Created by シェイミ on 13/07/2021.
//
// From Kavsoft: https://youtu.be/Wj_PJBWHWUc

import SwiftUI

// Custom View Builder.
// This is required because SwiftUI ScrollView currently does not have pagination. 
    
struct VerticalCarouselList<Content: View>: UIViewRepresentable {
    var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    func makeUIView(context: Context) -> some UIScrollView {
        let scrollView = UIScrollView()
        setUp(scrollView: scrollView)
        return scrollView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func setUp(scrollView: UIScrollView) {
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        
        // Extracting SwiftUI View
        let hostView = UIHostingController(rootView: content)
        // Clearing the background colour
        hostView.view.backgroundColor = .clear
        
        // Constraints
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostView.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            // Width
            hostView.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]
        
        scrollView.addSubview(hostView.view)
        scrollView.addConstraints(constraints)
    }
}
