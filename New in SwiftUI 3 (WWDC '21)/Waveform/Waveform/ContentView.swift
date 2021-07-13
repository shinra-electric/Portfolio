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
    
    @State private var wave1 = Wave(color: .teal, amplification: 150, isReversed: false, opacity: 0.7)
    @State private var wave2 = Wave(color: .indigo, amplification: 150, isReversed: true, opacity: 0.4)
    
    var body: some View {
        ZStack {
            Waveform(wave: wave1)
            Waveform(wave: wave2)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showPreferencesSheet.toggle()
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                        .font(.title)
                        .halfSheet(showSheet: $showPreferencesSheet) {
                            PreferencesSheetView(wave1: $wave1, wave2: $wave2)
                        } onEnd: { } 
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
