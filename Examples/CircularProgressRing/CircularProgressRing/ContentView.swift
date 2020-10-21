//
//  ContentView.swift
//  CircularProgressRing
//
//  Created by シェイミ on 15/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0.0
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.2)
                .foregroundColor(Color.purple)
            
            Text(String(format: "%.0f%%", min(self.progress, 1) * 100))
                .font(.system(size: 100))
            
            
            Circle()
                .trim(from: 0.0, to: CGFloat(self.progress))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.purple)
                .animation(Animation.linear(duration: 2.0))
            
            Button("Start") {
                self.progress = 0.0
                
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.progress += 0.01
                if self.progress >= 1 {
                    timer.invalidate()
                }
                }
            }.offset(y: 300)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}































