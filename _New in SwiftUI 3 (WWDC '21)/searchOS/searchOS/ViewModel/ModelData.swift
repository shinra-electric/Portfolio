//
//  ModelData.swift
//  searchOS
//
//  Created by シェイミ on 23/06/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var oses: [MacOSModel] = Bundle.main.decode([MacOSModel].self, from: "macos.json")
    
    
    // MARK: Search
    @Published var searchText: String = ""
    
    var searchResults: [MacOSModel] {
        get {
            if searchText.isEmpty {
               return filteredOS
            } else {
               return filteredOS.filter { $0.codename.range(of: searchText, options: .caseInsensitive) != nil }
            }
        }
        // Computed properties need to have a Set value, or else can't be passed into a ForEach loop
        set {  }
    }
    
    
    // MARK: Filtering
    @Published var showFavoritesOnly = false
    @Published var filter = FilterCategory.all
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case ppc = "PowerPC"
        case intel = "Intel"
        case arm = "ARM"
        
        case thirtyTwoBit = "32-bit"
        case sixtyFourBit = "64-bit"
        
        var id: FilterCategory { self }
    }
    
    var filteredOS: [MacOSModel] {
        oses.filter { os in
            (!showFavoritesOnly
             || os.isFavourite) &&
            (filter == .all
             || os.architecture.rawValue.contains(filter.rawValue)
             || os.applications.rawValue.contains(filter.rawValue)
            )
        }
    }
}