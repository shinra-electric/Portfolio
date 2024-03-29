//
//  Home.swift
//  Home
//
//  Created by シェイミ on 23/08/2021.
//
// Kavsoft - https://youtu.be/cY-Feaqkbng

import SwiftUI

struct Home: View {
    
    var screenSize: CGSize
    @State private var offset: CGFloat = 0
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: "applelogo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            OffsetPageTabView(offset: $offset) {
                
                HStack(spacing: 0) {
                    ForEach(intros) { intro in
                        VStack {
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)
                            
                            VStack(alignment: .leading, spacing: 22) {
                                Text(intro.title)
                                    .font(.largeTitle.bold())
                                Text(intro.description)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            .foregroundStyle(.white)
                            .padding(.top, 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        .frame(width: screenSize.width)     // Setting width to match the screen
                    }
                }
            }
            
            // Animated Indiactor
            HStack(alignment: .bottom) {
                
                // Indicators
                HStack(spacing: 12) {
                    ForEach(intros.indices, id: \.self) { index in
                        Capsule()
                            .fill(.white)
                            .frame(width: getIndex() == index ? 20 : 7, height: 7) // Increasing width for only the current index

                    }
                }
                .overlay(
                    
                    Capsule()
                        .fill(.white)
                        .frame(width: 20, height: 7)
                        .offset(x: getIndicatorOffset())
                    
                    , alignment: .leading
                )
                .offset(x: 10, y: -15)
                
                Spacer()
                
                Button {
                    // Update the offset
                    let index = min(getIndex() + 1, intros.count - 1)
                    
                    offset = CGFloat(index) * screenSize.width
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(20)
                        .background(
                            intros[getIndex()].color,
                            in: Circle()
                        
                        
                        )
                }
            }
            .padding()
            .offset(y: -20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        // Animating when index changes
        .animation(.easeInOut, value: getIndex())
        
//        .onChange(of: offset) { _ in
//            print(offset)
//        }
    }
    
    // Offset for indicator
    func getIndicatorOffset() -> CGFloat {
        let progress = offset / screenSize.width
        
        let maxWidth: CGFloat = 12 + 7    // 12 = spacing, 7 = Circle size
        
        return progress * maxWidth
    }
    
    
    // Expanding index based on offset
    func getIndex() -> Int {
        let progress = round(offset / screenSize.width)
        
        // For safety
        let index = min(Int(progress), intros.count - 1)
        
        return index
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
