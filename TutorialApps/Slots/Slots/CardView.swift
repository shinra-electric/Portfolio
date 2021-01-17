//
//  CardView.swift
//  Slots
//
//  Created by シェイミ on 08/01/2021.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol: String
    @Binding var background: Color
    
    private let transition: AnyTransition = AnyTransition.move(edge: .bottom)
    
    var body: some View {
        VStack {
            if symbol == "apple" {
                Image(symbol)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            }
            else if symbol == "cherry" {
                Image(symbol)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            }
            else if symbol == "star" {
                Image(symbol)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .transition(transition)
            }
            else {
                // Display an invisible apple image the symbol is "none"
                Image("apple")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .opacity(0)
                    .transition(transition)
            }
        }
        .background(background.opacity(0.5))
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cherry"), background: Binding.constant(.green))
            .padding()
    }
}

