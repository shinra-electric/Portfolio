//
//  ContentView.swift
//  Slots
//
//  Created by シェイミ on 08/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "star", "cherry", "none"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var credits = 1000
    @State private var win = false
    private var betAmount = 5
    
    
    
    
    var body: some View {
        ZStack {
            //Background
            BackgroundView()
            
            //Foreground
            VStack {
                Spacer()
                //Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                Spacer()
                
                //Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(win ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
                    .animation(.none)
                    .cornerRadius(20)
                    .scaleEffect(win ? 1.2 : 1)
                    .animation(.spring(response: 0.7, dampingFraction: 0.5))
                
                Spacer()
                
                //Cards
                VStack {
                    HStack {
                        Spacer()
                        CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        Spacer()
                    }
                }
                
                
                Spacer()
                
                //Buttons
                HStack(spacing: 20) {
                    
                    VStack {
                        Button(action: {
                            //Single spin
                            processResults()
                            
                        }) {
                            Text("Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all , 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        Text("\(betAmount) Credits")
                            .padding(10)
                            .font(.footnote)
                    }
                    
                    VStack {
                        Button(action: {
                            //Max spin
                            processResults(true)
                            
                        }) {
                            Text("Max Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all , 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        Text("\(betAmount * 5) Credits")
                            .padding(10)
                            .font(.footnote)
                    }
                    
                }
                Spacer()
            }
        }
        .animation(.easeOut)
    }
    
    func processResults(_ isMax: Bool = false) {
        
        //Set all backgrounds back to white
        backgrounds = backgrounds.map { _ in
            Color.white
        }
        
        //Change the images
        if isMax {
            numbers = numbers.map { _ in
                Int.random(in: 0..<symbols.count - 1)
            }
        } else {
            //Spin the middle row
            numbers[3] = Int.random(in: 0..<symbols.count - 1)
            numbers[4] = Int.random(in: 0..<symbols.count - 1)
            numbers[5] = Int.random(in: 0..<symbols.count - 1)
            
            //fade out the top and bottom rows
            numbers[0] = 3
            numbers[1] = 3
            numbers[2] = 3
            numbers[6] = 3
            numbers[7] = 3
            numbers[8] = 3
        }
        
        processWin(isMax)
        
    }
    
    func processWin(_ isMax:Bool = false) {
        var matches = 0
        
        if isMax {
            //Processing for multiple spin
            
            //Top row
            if isMatch(0, 1, 2) { matches += 1 }
            
            //Middle row
            if isMatch(3, 4, 5) { matches += 1 }
                        
            //Top row
            if isMatch(6, 7, 8) { matches += 1 }
            
            //Diagonal top left to bottom right
            if isMatch(0, 4, 8) { matches += 1 }
            
            //Diagonal top right to bottom left
            if isMatch(2, 4, 6) { matches += 1 }
            
        }
        else {
            //Processing for single spin
            if isMatch(3, 4, 5) { matches += 1 }
        }
        
        win = false
        //Check matches and distribute credits
        if matches > 0 {
            // At least 1 win
            credits += matches * betAmount * 2
            win = true
        }
        else if !isMax {
            // 0 wins, single spin
            credits -= betAmount
        }
        else {
            // 0 wins, max spin
            credits -= betAmount * 5
        }
    }
    
    func isMatch(_ index1:Int, _ index2:Int, _ index3:Int) -> Bool {
        if numbers[index1] == numbers[index2] && numbers[index2] == numbers[index3] {
            
            //Update backgrounds
            backgrounds[index1] = Color.green
            backgrounds[index2] = Color.green
            backgrounds[index3] = Color.green
            
            return true
        }
        return false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}













