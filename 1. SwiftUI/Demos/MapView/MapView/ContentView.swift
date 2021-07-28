//
//  ContentView.swift
//  MapView
//
//  Created by シェイミ on 11/02/2021.
//

import MapKit
import SwiftUI

struct ContentView: View {
    // Set a state variable to set the centre of the map and zoom level (span)
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53.35, longitude: -6.266667), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}













