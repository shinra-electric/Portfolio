//
//  OffsetPageTabView.swift
//  OffsetPageTabView
//
//  Created by Xianmo on 31/08/2021.

// Kavsoft demo https://youtu.be/rCgbJf5SWQE

import SwiftUI

// Fallback to UIKit for this

struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return OffsetPageTabView.Coordinator(parent: self)
    }
    
    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self._offset = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollview = UIScrollView()
        
        // Extract the SwiftUI View and embed it into a UIKit ScrollView
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Clear the background colour
        hostview.view.backgroundColor = .clear
        
        
        let constraints = [
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            
            // If using vertical paging, don't declare height constraint
            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
        ]
        
        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)
        
        // Enable paging
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        
        // Set the delegate
        scrollview.delegate = context.coordinator
        
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // Need to update only when offset is changed manually with the button
        // Just check the current and scrollview offsets
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset {
//            print("Updating offset manually")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    // Pager offset
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: OffsetPageTabView
        
        init(parent: OffsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
    
}
