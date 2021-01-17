//
//  SpinOneButtonView.swift
//  Slots
//
//  Created by シェイミ on 15/01/2021.
//

import SwiftUI

struct SpinOneButtonView: View {
    var body: some View {
        Button(action: {
            //Set backgrounds back to white
            backgrounds = backgrounds.map { _ in
                Color.white
            }
            
            
            //Change the images
            row1 = row1.map { _ in
                Int.random(in: 0..<symbols.count)
            }
            
            row2 = row2.map { _ in
                Int.random(in: 0..<symbols.count)
            }
            
            row3 = row3.map { _ in
                Int.random(in: 0..<symbols.count)
            }
            
            checkWinnings()
            
        }) {
            Text("Spin")
                .bold()
                .foregroundColor(.white)
                .padding(.all , 10)
                .padding([.leading, .trailing], 30)
                .background(Color.pink)
                .cornerRadius(20)
        }
    }
    
    func checkWinnings() {
        
        if row1[0] == row1[1] && row1[1] == row1[2] {
            //Won
            credits += betAmount * 10
            
            //Update backgrounds
            backgrounds = backgrounds.map { _ in
                Color.green
            }
            
        }
        else {
            //Lose
            credits -= betAmount
        }
    }
}

struct SpinOneButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SpinOneButtonView()
    }
}
