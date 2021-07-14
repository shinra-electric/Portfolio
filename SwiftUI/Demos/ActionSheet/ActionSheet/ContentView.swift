//
//  ContentView.swift
//  ActionSheet
//
//  Created by シェイミ on 15/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    @State private var foregroundColor = Color.blue
    
    var body: some View {
        
        Text("Tap me")
            .frame(width: 300, height: 300)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Change Background"), message: Text("Select a new colour"), buttons: [
                .default(Text("Red")) { self.backgroundColor = .red; self.foregroundColor = .black },
                .default(Text("Blue")) { self.backgroundColor = .blue; self.foregroundColor = .yellow },
                .default(Text("Green")) { self.backgroundColor = .green; self.foregroundColor = .red },
                .cancel() { self.backgroundColor = .white; self.foregroundColor = .blue}
                ])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
