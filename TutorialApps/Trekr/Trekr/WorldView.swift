//
//  WorldView.swift
//  Trekr
//
//  Created by シェイミ on 20/01/2021.
//

import MapKit
import SwiftUI

struct WorldView: View {
    // Looks for locations in the environment and default the co-ordinates to Dublin
    @EnvironmentObject var locations: Locations
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53.35, longitude: -6.266667), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    var body: some View {
        // Display the locations and move to contentView when a flag is tapped. 
        
        Map(coordinateRegion: $region, annotationItems: locations.places) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(
                    destination: ContentView(location: location)) {
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                        .shadow(radius: 3)
                }
            }
        }
        .navigationTitle("Locations")
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
