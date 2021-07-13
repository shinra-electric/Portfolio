//
//  PreferencesSheetView.swift
//  Waveform
//
//  Created by シェイミ on 26/06/2021.
//

import SwiftUI

struct PreferencesSheetView: View {
    @Binding var wave1: Wave
    @Binding var wave2: Wave

    var body: some View {
        VStack {
            List {
                Section("First Wave") {
                    ColorPicker("Change Colour", selection: $wave1.color)
                    HStack {
                        Text("Wave Height")
                        Slider(value: $wave1.amplification, in: 40...300)
                    }
                    Toggle("Reverse Direction", isOn: $wave1.isReversed)
                }
                .tint(wave1.color)
                
                Section("Second Wave") {
                    ColorPicker("Change Colour", selection: $wave2.color)
                    HStack {
                        Text("Wave Height")
                        Slider(value: $wave2.amplification, in: 40...300)
                    }
                    Toggle("Reverse Direction", isOn: $wave2.isReversed)
                }
                .tint(wave2.color)
            }
            .labelStyle(.iconOnly)
            
        }
    }
    
}

struct PreferencesSheetView_Previews: PreviewProvider {
    @State static var wave1 = Wave(color: .teal, amplification: 150, isReversed: false, opacity: 0.7)
    @State static var wave2 = Wave(color: .indigo, amplification: 150, isReversed: true, opacity: 0.4)
    
    static var previews: some View {
        PreferencesSheetView(wave1: Binding(projectedValue: $wave1), wave2: Binding(projectedValue: $wave2))
    }
}
