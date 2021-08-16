//
//  ContentView.swift
//  NewButtons
//
//  Created by Xianmo on 19/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var toggle1: Bool = false
    @State private var toggle2: Bool = false
    @State private var toggle3: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                
                Section("Small Size (Standard Colour)") {
                    HStack {
                        Text("Bordered")
                        Spacer()
                        borderedButton()
                    }
                    
                    HStack {
                        Text("Prominent Bordered")
                        Spacer()
                        prominentBorderedButton()
                    }
  
                    HStack {
                        Text("Toggle Button")
                        Spacer()
                        Toggle(isOn: $toggle1, label: {
                            Image(systemName: "hand.tap")
                        })
                            .toggleStyle(.button)
                    }
                }
                .controlSize(.small)
                
                
                Section("Regular Size (Mint Tint)") {
                    HStack {
                        Text("Bordered")
                        Spacer()
                        borderedButton()
                    }
                    
                    HStack {
                        Text("Prominent Bordered")
                        Spacer()
                        prominentBorderedButton()
                    }
                    
                    HStack {
                        Text("Toggle Button")
                        Spacer()
                        Toggle(isOn: $toggle2, label: {
                            Image(systemName: "hand.tap")
                        })
                            .toggleStyle(.button)
                            
                    }
                }
                .tint(.mint)
                .controlSize(.regular)
                       
                Section("Large Size (Indigo Tint)") {
                    HStack {
                        Text("Bordered")
                        Spacer()
                        borderedButton()
                    }
                    
                    HStack {
                        Text("Prominent Bordered")
                        Spacer()
                        prominentBorderedButton()
                            
                    }
                    
                    HStack {
                        Text("Toggle Button")
                        Spacer()
                        Toggle(isOn: $toggle3, label: {
                            Image(systemName: "hand.tap")
                        })
                            .toggleStyle(.button)
                    }
                }
                .tint(.indigo)
                .controlSize(.large)
                
            }
            .labelStyle(.iconOnly)
            .navigationTitle("New Button Styles")
        }
    }
}

struct borderedButton: View {
    var body: some View {
        Button(action: { }, label: {
            Label("Tap", systemImage: "hand.tap")
            
        })
            .buttonStyle(.bordered)
    }
}

struct prominentBorderedButton: View {
    var body: some View {
        Button(action: { }, label: {
            Label("Tap", systemImage: "hand.tap")
            
        })
            .buttonStyle(.bordered)
            .controlProminence(.increased)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
