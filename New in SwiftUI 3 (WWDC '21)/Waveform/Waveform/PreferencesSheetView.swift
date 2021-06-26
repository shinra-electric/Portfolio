//
//  PreferencesSheetView.swift
//  Waveform
//
//  Created by シェイミ on 26/06/2021.
//

import SwiftUI

struct PreferencesSheetView: View {
    // Wave 1
    @Binding var color1: Color
    @Binding var amplification1: CGFloat
    @Binding var isReversed1: Bool
    
    // Wave 2
    @Binding var color2: Color
    @Binding var amplification2: CGFloat
    @Binding var isReversed2: Bool
    
    var body: some View {
        VStack {
            List {
                Section("First Wave") {
                    ColorPicker("Change Colour", selection: $color1)
                    HStack {
                        Text("Wave Height")
                        Slider(value: $amplification1, in: 40...300)
                    }
                    Toggle("Reverse Direction", isOn: $isReversed1)
                }
                .tint(color1)
                
                Section("Second Wave") {
                    ColorPicker("Change Colour", selection: $color2)
                    HStack {
                        Text("Wave Height")
                        Slider(value: $amplification2, in: 40...300)
                    }
                    Toggle("Reverse Direction", isOn: $isReversed2)
                }
                .tint(color2)
            }
            .labelStyle(.iconOnly)
            
        }
    }
    
}

struct PreferencesSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesSheetView(color1: .constant(.indigo), amplification1: .constant(150), isReversed1: .constant(false), color2: .constant(.teal), amplification2: .constant(145), isReversed2: .constant(true))
    }
}
