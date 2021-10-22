//
//  Home.swift
//  SyncedCarouselList
//
//  Created by Xianmo on 21/10/2021.
//
// Demo by Kavsoft https://youtu.be/8MrJwlvfGHQ

import SwiftUI

struct Home: View {
    // Posts
    @State private var posts: [Post] = []
    
    @State private var currentPost: String = ""
    
    @State private var fullPreview: Bool = false
    
    var body: some View {
        TabView(selection: $currentPost) {
            ForEach(posts) { post in
                
                // Get screen size
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(0)
                    
                }
                .tag(post.id)
                .ignoresSafeArea()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation {
                fullPreview.toggle()
            }
        }
        // Top Detail View
        .overlay(
            HStack {
                Text("iPhone Wallpaper")
                    .font(.title2.bold())
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.title2)
                }
            }
                .foregroundColor(.white)
                .padding()
                .background(
                    BlurView(style: .systemUltraThinMaterialDark)
                        .ignoresSafeArea())
                // Hiding the top bar
                .offset(y: fullPreview ? -150 : 0)
            ,
            alignment: .top
        )
        
        // Bottom Images view
        .overlay(
            // Scrollview reader to navigate to the current image
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(posts) { post in
                            Image(post.postImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 60)
                                .cornerRadius(12)
                            // Showing ring for current image
                                .padding(2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(Color.white, lineWidth: 2)
                                        .opacity(currentPost == post.id ? 1 : 0)
                                )
                                .id(post.id)
                                .onTapGesture {
                                    withAnimation {
                                        currentPost = post.id
                                    }
                                }
                        }
                    }
                    .padding()
                }
                .frame(height: 80)
                .background(
                    BlurView(style: .systemUltraThinMaterialDark)
                        .ignoresSafeArea())
                // As CurrentPost changes , move the current image view to the centre of the scrollview
                .onChange(of: currentPost) { _ in
                    withAnimation {
                        proxy.scrollTo(currentPost, anchor: .bottom)
                    }
                }
            }
            // Hiding the bottom bar
            .offset(y: fullPreview ? 150 : 0)
            ,
            alignment: .bottom
        )
        
        // Insert Sample Post Image
        .onAppear {
            for index in 1...15 {
                posts.append(Post(postImage: "post\(index)"))
            }
            
            currentPost = posts.first?.id ?? ""
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
