//
//  ContentView.swift
//  searchOS
//
//  Created by シェイミ on 22/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
        
    let list = Bundle.main.decode([MacOSModel].self, from: "macos.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { os in
                    NavigationLink(destination: DetailView(os: os)) {
                        Text(os.codename)
                    }
                    
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("macOS Versions")
        }
        .accentColor(.primary)
    }
    
    var searchResults: [MacOSModel] {
        if searchText.isEmpty {
            return list
        } else {
            return list.filter { $0.codename.range(of: searchText, options: .caseInsensitive) != nil }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
