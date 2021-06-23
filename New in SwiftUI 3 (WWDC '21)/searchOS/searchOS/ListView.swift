//
//  ContentView.swift
//  searchOS
//
//  Created by シェイミ on 22/06/2021.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var modelData: ModelData
    
    // MARK: Search
    @State private var searchText: String = ""
    
    var searchResults: [MacOSModel] {
        if searchText.isEmpty {
            return filteredOS
        } else {
            return filteredOS.filter { $0.codename.range(of: searchText, options: .caseInsensitive) != nil }
        }
    }
    
    // MARK: Filtering
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case ppc = "PowerPC"
        case intel = "Intel"
        case arm = "ARM"
        
        case thirtytwoBit = "32-bit"
        case sixtyFourBit = "64-bit"
        
        var id: FilterCategory { self }
    }
    
    var filteredOS: [MacOSModel] {
        modelData.oses.filter { os in
            (!showFavoritesOnly
             || os.isFavourite) &&
            (filter == .all
             || os.architecture.rawValue.contains(filter.rawValue)
             || os.applications.rawValue.contains(filter.rawValue)
            )
        }
    }
    
    // MARK: Body
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
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Architecture", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(InlinePickerStyle())
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favourites only", systemImage: "star.fill")
                        }
                        
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }

        }
        .accentColor(.primary)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
