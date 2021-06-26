//
//  ContentView.swift
//  Waveform
//
//  Created by シェイミ on 24/06/2021.
//
// Tutorial by Kavsoft here: https://youtu.be/qHGpf4fmjrA

import SwiftUI

struct ContentView: View {
    @State private var showPreferencesSheet: Bool = false
    
    // Wave 1
    @State private var customColor1: Color = .teal
    @State private var amplification1: CGFloat = 150
    @State private var isReversed1: Bool = false
    
    // Wave 2
    @State private var customColor2: Color = .indigo
    @State private var amplification2: CGFloat = 150
    @State private var isReversed2: Bool = true
    
    var body: some View {
        ZStack {
            Waveform(colour: customColor1.opacity(0.7), amplification: amplification1, isReversed: isReversed1)
            Waveform(colour: customColor2.opacity(0.4), amplification: amplification2, isReversed: isReversed2)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showPreferencesSheet.toggle()
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                        .font(.title)
                        .sheet(isPresented: $showPreferencesSheet) {
                            PreferencesSheetView(
                                color1: $customColor1,
                                amplification1: $amplification1,
                                isReversed1: $isReversed1,
                                color2: $customColor2,
                                amplification2: $amplification2,
                                isReversed2: $isReversed2)
                        }
                        
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
