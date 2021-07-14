//
//  ForYou.swift
//  Carousel1
//
//  Created by シェイミ on 13/07/2021.
//

// From Kavsoft: https://youtu.be/Wj_PJBWHWUc

import SwiftUI

struct ForYou: View {
    var topEdge: CGFloat
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text("Today For You")
                    .font(.title.bold())
                
                Spacer(minLength: 10)
                
                Button {
                    
                } label: {
                    Image(systemName: "person.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                        .overlay(
                            Circle()
                                .fill(.red)
                                .frame(width: 13, height: 13)
                                .offset(x: -1, y: -1)
                            , alignment: .topTrailing
                        )
                }
                
            }
            .padding(.horizontal)
            // Setting maxHeight for offset calculation
            .frame(height: 70)

            
            GeometryReader { proxy in
                let size = proxy.size
                
                // Custom Carousel List
                VerticalCarouselList {
                    
                    VStack(spacing: 0) {
                        // Films
                        ForEach(movies) { movie in
                           // Card View
                            // Re: topOffset: 70 = Title View, 15 = Spacing
                            // Remaining is SafeArea top
                            MovieCardView(movie: movie, topOffset: 70 + 15 + topEdge)
                                .frame(height: size.height)
                        }
                    }
                }
                
            }
        }
    }
}


struct MovieCardView: View {
    var movie: Movie
    var topOffset: CGFloat
    
    var body: some View {
       // Use GeometryReader to get size of image
        
        GeometryReader { proxy in
            let size = proxy.size
            
            // Scaling and Opacity Effects
            let minY = proxy.frame(in: .global).minY - topOffset
            
            let progress = -minY / size.height
            
            // Increasing scale by 3
            let scale = 1 - (progress / 3)
            
            let opacity = 1 - progress
            
            ZStack {
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height - 80)
                .cornerRadius(15)
            }
            .padding(.horizontal, 15)
            .scaleEffect(minY < 0 ? scale : 1)
            .opacity(minY < 0 ? opacity : 1)
            // Stop view when Y value is < 0
            .offset(y: minY < 0 ? -minY : 0)
        }
    }
}



struct ForYou_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
