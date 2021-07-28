//
//  BackgroundView.swift
//  Slots
//
//  Created by シェイミ on 13/01/2021.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        
        Rectangle()
            .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        Rectangle()
            .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
            .rotationEffect(Angle(degrees: 45))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
