//
//  ContentView.swift
//  AnimatedElasticTabBar
//
//  Created by シェイミ on 13/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom
            
            Home(size: size, bottomEdge: bottomEdge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
