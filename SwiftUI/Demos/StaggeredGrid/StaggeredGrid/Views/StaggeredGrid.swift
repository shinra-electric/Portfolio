//
//  StaggeredGrid.swift
//  StaggeredGrid
//
//  Created by Xianmo on 16/07/2021.
//
// From Kavsoft https://youtu.be/VrwINubmq5g

import SwiftUI

// Custom Viewbuilder

// T -> is to hold the identifiable collection of data

struct StaggeredGrid<Content: View, T: Identifiable>: View where T: Hashable {
    // This returns each object in the collection to the build view
    var content: (T) -> Content
    var list: [T]
    
    // columns
    var columns: Int
    
    
    // Properties
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.columns = columns
        self.showsIndicators = showsIndicators
        self.spacing = spacing
        self.content = content
        self.list = list
    }
    
    // Staggered grid function
    func setUpList() -> [[T]] {
        // Create empty sub-array of columns count
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        // Split array for VStack View
        var currentIndex: Int = 0
        for object in list {
            gridArray[currentIndex].append(object)
            
            // Increment index count and reset if columns count is out of bounds
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        // Note: Due to a bug in Xcode 13 Beta 3, the LazyVStack did not load some images when the columns changed. I used a simple VStack for the video clip on Github. 
        
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            HStack(alignment: .top) {
                ForEach(setUpList(), id: \.self) { columnsData in
                    LazyVStack(spacing: spacing) {
                        ForEach(columnsData) { object in
                            content(object)
                        }
                    }
                }
            }
            .padding(.vertical)
            // Only vertical padding. Horizontal padding will be an option.
        }
    }
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
