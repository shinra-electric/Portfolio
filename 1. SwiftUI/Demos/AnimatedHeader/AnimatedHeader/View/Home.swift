//
//  Home.swift
//  Home
//
//  Created by シェイミ on 27/07/2021.
//
// From Kavsoft https://youtu.be/hmifqxD7seI


import SwiftUI

struct Home: View {
    let maxHeight = UIScreen.main.bounds.height / 2.3
    var topEdge: CGFloat
    
    // Offset
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                //                Top Navigation View
                GeometryReader { proxy in
                    TopBar(topEdge: topEdge, maxHeight: maxHeight, offset: $offset)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        // Sticky effect
                        .frame(height: getHeaderHeight(), alignment: .bottom)
                        // Using background(_ in: Shape) is new in SwiftUI 3
                        .background(Color.indigo, in: CustomCorner(corners: [.bottomRight], radius: getCornerRadius()))
                        .overlay(
                            // Top Navigation View
                            HStack(spacing: 15) {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "xmark")
                                        .font(.body.bold())
                                }
                                
                                Image("monkey")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                    .opacity(topBarTitleOpacity())
                                
                                Text("The Monkey King")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .opacity(topBarTitleOpacity())
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "line.3.horizontal.decrease")
                                        .font(.body.bold())
                                }
                            }
                                .padding(.horizontal)
                            // MaxHeight
                                .frame(height: 80)
                                .foregroundColor(.white)
                                .padding(.top, topEdge)
                            , alignment: .top
                        )
                }
                .frame(height: maxHeight)
                // Fix to the top
                .offset(y: -offset)
                .zIndex(1)
                
                // Example messages
                VStack(spacing: 15) {
                    ForEach(allMessages) { message in
                        // Card view
                        MessageCardView(message: message)
                    }
                }
                .padding()
                .zIndex(0)
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        // Set coordinate space
        .coordinateSpace(name: "SCROLL")
    }
    
    func getHeaderHeight() -> CGFloat {
        let topHeight = maxHeight + offset
        // 80 is the constant navbar height
        // Included top safe area, so need to include that also
        return topHeight > (80 + topEdge) ? topHeight : (80 + topEdge)
    }
    
    func getCornerRadius() -> CGFloat {
        let progress = -offset / (maxHeight - (80 + topEdge))
        let value = 1 - progress
        let radius = value * 50
        return offset < 0 ? radius : 50
    }
    
    func topBarTitleOpacity() -> CGFloat {
        // To start after the main content disappears, remove 70 from the offset
        let progress = -(offset + 60) / (maxHeight - (80 + topEdge))
        return progress
    }
}


struct TopBar: View {
    var topEdge: CGFloat
    var maxHeight: CGFloat
    @Binding var offset: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Image("Monkey")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            Text("孙悟空")
                .font(.largeTitle.bold())
            
            Text("Known for his penchant for the Peaches of Immortality, and for reaching the Five Pillars at the end of the Universe.")
                .fontWeight(.semibold)
                .foregroundColor(.white.opacity(0.8))
            
        }
        .padding()
        .padding(.bottom)
        .opacity(getOpacity())
    }
    
    // Calculate opacity
    func getOpacity() -> CGFloat {
        
        // 70 is a random amount of time to become visible on scroll
        let progress = -offset / 70
        let opacity = 1 - progress
        return offset < 0 ? opacity : 1
    }
    
    
}

struct MessageCardView: View {
    var message: Message
    
    var body: some View {
        HStack(spacing: 15) {
            Image(message.userName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .opacity(0.8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(message.userName)
                    .fontWeight(.bold)
                
                Text(message.message)
                    .foregroundColor(.secondary)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
