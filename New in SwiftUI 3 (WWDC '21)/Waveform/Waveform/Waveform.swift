//
//  Waveform.swift
//  Waveform
//
//  Created by シェイミ on 26/06/2021.
//

import SwiftUI

struct Waveform: View {
    // Custom colour
    var colour: Color
    var amplification: CGFloat
    var isReversed: Bool
    
    var body: some View {
        TimelineView(.animation) { timeline in
            
            Canvas { context, size in
                //get current time
                let currentTime = timeline.date.timeIntervalSinceReferenceDate
                
                // Animating the wave using the current time
                let angle = currentTime.remainder(dividingBy: 2)
                
                // calculating offset
                let offset = angle * size.width
                
                //                context.draw(Text("\(offset)"), at: CGPoint(x: size.width / 2, y: 100))
                // This text shows the value moving between -1.5 <--> 1.5 (i.e. 3/2 = 1.5)
                // Divide by 2 gives -1 <--> 1  (i.e. 2/2 = 1)
                
                //Moving the whole view
                context.translateBy(x: isReversed ? -offset : offset, y: 0)
                
                // Using SwiftUI Path for drawing the waveform,
                context.fill(getPath(size: size), with: .color(colour))
                
                // Draw curve front and back so translation will look like wave animation
                context.translateBy(x: -size.width, y: 0)
                context.fill(getPath(size: size), with: .color(colour))
                
                context.translateBy(x: size.width * 2, y: 0)
                context.fill(getPath(size: size), with: .color(colour))
                
            }
        }
    }
    
    func getPath(size: CGSize) -> Path {
        
        return Path { path in
            let height = (size.height / 3) * 2
            let width = size.width
            
            // move the wave to centre leading part of the screen
            path.move(to: CGPoint(x: 0, y: height))
            
            // Draw curve
            
            // This is for the waveform. Change the amplification value to adjust. Mess around with plus or minus.
            path.addCurve(to: CGPoint(x: width, y: height),
                          control1: CGPoint(x: width * 0.4, y: height + amplification),
                          control2: CGPoint(x: width * 0.65, y: height - amplification))
            // Mess around with the width multipliers to change the shape of the wave
            
            // fill the bottom area
            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            
        }
    }
}

struct Waveform_Previews: PreviewProvider {
    static var previews: some View {
        Waveform(colour: .indigo, amplification: 150, isReversed: false)
    }
}
