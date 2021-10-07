//
//  ContentView.swift
//  Shared
//
//  Created by Xianmo on 07/10/2021.
//
// Demo by Kavsoft https://youtu.be/z48rVDlbyG8

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .buttonStyle(BorderlessButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
