//
//  ContentView.swift
//  searchOS
//
//  Created by シェイミ on 22/06/2021.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { os in
                    NavigationLink(destination: DetailView(os: os)) {
                        OSRow(os: os)
                    }
                }
            }
            .listStyle(.sidebar)
            .searchable(text: $searchText)
            .navigationTitle("macOS Versions")
        }
        .accentColor(.primary)
    }
        
    
    var searchResults: [MacOSModel] {
        if searchText.isEmpty {
            return modelData.oses
        } else {
            return modelData.oses.filter { $0.codename.range(of: searchText, options: .caseInsensitive) != nil }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
