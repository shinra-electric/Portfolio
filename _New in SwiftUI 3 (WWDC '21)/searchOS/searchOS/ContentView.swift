//
//  ContentView.swift
//  searchOS
//
//  Created by シェイミ on 22/06/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    // MARK: Body
    var body: some View {
        NavigationView {
            List(modelData.searchResults) { os in
                NavigationLink(destination: DetailView(os: os, favorites: $modelData.favorites)) {
                    OSRow(os: os, isFavorite: modelData.favorites.contains(os))
                    
                }
                .swipeActions {     // Swipe actions need to be on the Navigation link if it's there, otherwise on the row is ok.
                    Button {
                        modelData.toggle(favorite: os)
                    } label: {
                        if modelData.favorites.contains(os) {
                            Label("Remove Favourite", systemImage: "star.slash")
                        } else {
                            Label("Add Favourite", systemImage: "star")
                        }
                    }
                    .tint(.blue)
                }
            }
            .searchable(text: $modelData.searchText.animation(), prompt: "What OS are you looking for?")
            .navigationTitle("macOS Versions")
            .toolbar {
                Menu {
                    Picker("Architecture", selection: $modelData.filter.animation()) {  //animation modifier needs to be on the selection.
                        ForEach(ModelData.FilterCategory.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    
                    Toggle(isOn: $modelData.showFavoritesOnly.animation()) {
                        Label("Favourites only", systemImage: "star.fill")
                    }
                    
                } label: {
                    Label("Filter", systemImage: "slider.horizontal.3")
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
