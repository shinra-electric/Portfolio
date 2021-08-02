//
//  ContentView.swift
//  PacManAnimation
//
//  Created by シェイミ on 01/08/2021.
// From CodeSlicing https://youtu.be/mprzVGTJwM0

import SwiftUI

private let pacManSize: CGFloat = 100
private let maxXOffset = (UIScreen.main.bounds.width * 0.5) + pacManSize * 0.5

struct ContentView: View {
    @State private var animatingMouth = false
    @State private var animatingPosition = false
    
    var body: some View {

        let xOffset = maxXOffset * (animatingPosition ? 1 : -1)
        
        PacMan(animatingMouth: animatingMouth)
            .fill(Color.yellow, style: .init(eoFill: true))
            .frame(width: pacManSize, height: pacManSize)
            .offset(x: xOffset)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.2).repeatForever()) {
                    animatingMouth = true
                }
                withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                    animatingPosition = true
                }
            }
    }
}


private struct PacMan: Shape {
    var animatableData: CGFloat
    
    init(animatingMouth: Bool) {
        animatableData = animatingMouth ? 1 : 0
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Move to the centre
        let rectCenter = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: rectCenter)
        
        
        // Mouth
        let startAngleMax = Angle.degrees(0)
        let startAngleMin = Angle.degrees(45)
        
        let startAngleDeltaDegrees = startAngleMax.degrees - startAngleMin.degrees
        let startAngleDegrees = startAngleMin.degrees + (startAngleDeltaDegrees * Double(animatableData))
        
        let endAngleMax = Angle.degrees(-0.001)
        let endAngleMin = Angle.degrees(-45)
        
        let endAngleDeltaDegrees = endAngleMax.degrees - endAngleMin.degrees
        let endAngleDegrees = endAngleMin.degrees + (endAngleDeltaDegrees * Double(animatableData))
        
        let startAngle = Angle.degrees(startAngleDegrees)
        let endAngle = Angle.degrees(endAngleDegrees)
        
        path.addArc(center: rectCenter, radius: rect.width * 0.5, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        
        // Eye
        let eyePosition = CGPoint(x: rect.minX + rect.width * 0.65,
                                  y: rect.minY + rect.height * 0.2)
        
        let eyeRadius = rect.width * 0.05
        let eyeDiameter = eyeRadius * 2
        let eyeOrigin = CGPoint(x: eyePosition.x - eyeRadius, y: eyePosition.y - eyeRadius)
        let eyeRect = CGRect(origin: eyeOrigin, size: CGSize(width: eyeDiameter, height: eyeDiameter))
        
        path.addEllipse(in: eyeRect)
        
        
        
        return path
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
