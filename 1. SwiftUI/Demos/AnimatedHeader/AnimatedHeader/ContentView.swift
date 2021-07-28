//
//  ContentView.swift
//  AnimatedHeader
//
//  Created by シェイミ on 27/07/2021.
//
// From Kavsoft https://youtu.be/hmifqxD7seI

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Get safe area size
        GeometryReader { proxy in
            let topEdge = proxy.safeAreaInsets.top
            
            Home(topEdge: topEdge)
                .ignoresSafeArea(.all, edges: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
