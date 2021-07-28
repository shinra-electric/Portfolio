//
//  ContentView.swift
//  StaggeredGrid
//
//  Created by Xianmo on 16/07/2021.
//
// From Kavsoft https://youtu.be/VrwINubmq5g

import SwiftUI

struct ContentView: View {
    @State private var posts: [Post] = []
    @State private var columns: Int = 2
    
    // @Namespace creates an animation namespace to allow matched geometry effects, which can be shared by other views.
    @Namespace var animation
    
    var body: some View {
        NavigationView {
            StaggeredGrid(columns: columns, list: posts, content: { post in
                PostCardView(post: post)
                    .matchedGeometryEffect(id: post.id, in: animation)
            })
                .padding(.horizontal)
                .navigationTitle("Staggered Grid")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            columns = min(columns + 1, 5)
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            columns = max(columns - 1, 1)
                        } label: {
                            Image(systemName: "minus.circle")
                        }
                    }
                }
                .animation(.easeInOut, value: columns)
        }
        .onAppear {
            for index in 1...30 {
                posts.append(Post(imageURL: "poster\(index)"))
            }
            posts.shuffle()
        }
    }
}


struct PostCardView: View {
    var post: Post
    
    var body: some View {
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
