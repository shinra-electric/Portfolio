//
//  ContentView.swift
//  searchOS
//
//  Created by シェイミ on 22/06/2021.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var modelData: ModelData
    
    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach($modelData.searchResults, id: \.self) { $os in
                    NavigationLink(destination: DetailView(os: os)) {
                        OSRow(os: os)
                    }
                    .swipeActions(allowsFullSwipe: false) {
                        // Note: Animations for swipes don't seem to be smooth in Xcode 12 Beta 2
                        Button {
                            // need to use the index of modelData, can't simply say os.isFavourite.toggle()
                            modelData.oses[modelData.oses.firstIndex(of: os)!].isFavourite.toggle()
                        } label: {
                            Label("Favourite", systemImage: "star.fill")
                        }
                        .tint(.blue)
                    }
                }
            }
            .searchable(text: $modelData.searchText, prompt: "What OS are you looking for?")
            .navigationTitle("macOS Versions")
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Architecture", selection: $modelData.filter) {
                            ForEach(ModelData.FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(InlinePickerStyle())
                        
                        Toggle(isOn: $modelData.showFavoritesOnly) {
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
        ListView()
            .environmentObject(ModelData())
    }
}
