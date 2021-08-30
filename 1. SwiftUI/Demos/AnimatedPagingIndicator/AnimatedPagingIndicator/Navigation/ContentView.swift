 //
//  ContentView.swift
//  AnimatedPagingIndicator
//
//  Created by シェイミ on 23/08/2021.
//
// Kavsoft - https://youtu.be/cY-Feaqkbng

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GeometryReader { proxy in
            let size = proxy.size
            
            Home(screenSize: size)
                .preferredColorScheme(.dark)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
