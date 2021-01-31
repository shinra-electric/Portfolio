//
//  RowView.swift
//  Slots
//
//  Created by シェイミ on 08/01/2021.
//

import SwiftUI


struct RowView: View {
    @Binding var row: [Int]
    @Binding var symbols: [String]
    @Binding var background: [Color]
    
    var body: some View {
        HStack {
            Spacer()
            
            CardView(symbol: $symbols[row[0]], background: $background[0])

            CardView(symbol: $symbols[row[1]], background: $background[1])
            
            CardView(symbol: $symbols[row[2]], background: $background[2])
            
            Spacer()
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(row: Binding.constant([0, 1, 2]), symbols: Binding.constant(["apple", "star", "cherry"]), background: Binding.constant([Color.green, Color.green, Color.green]))
    }
}
