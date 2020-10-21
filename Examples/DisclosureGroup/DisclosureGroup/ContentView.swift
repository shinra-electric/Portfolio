//
//  ContentView.swift
//  DisclosureGroup
//
//  Created by シェイミ on 29/07/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            //The isExpanded binding is optional, if you want to use a hide button
            //Without the button, it just hides by tapping the navigation arrow.
            DisclosureGroup("Show details", isExpanded: $showDetails) {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
                                
                Button("Hide details") {
                    showDetails.toggle()
                }
            }
            .padding()
            
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
