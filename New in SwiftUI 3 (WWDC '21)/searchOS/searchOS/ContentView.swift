//
//  MainView.swift
//  searchOS
//
//  Created by シェイミ on 23/06/2021.
//

import SwiftUI

struct ContentView: View {
    //    @State private var selection: Tab = .list
    //
    //    enum Tab { case featured, list }
    
    var body: some View {
        ListView()
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
