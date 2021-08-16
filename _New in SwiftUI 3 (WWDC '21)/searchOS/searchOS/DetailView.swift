//
//  DetailView.swift
//  Search
//
//  Created by シェイミ on 21/06/2021.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var modelData: ModelData
    
    var os: MacOSModel
    @Binding var favorites: Set<MacOSModel>
    
    var body: some View {
        VStack {
            Image(os.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            VStack(alignment: .center) {
                VStack(spacing: 8) {
                    Text("macOS \(os.id) ")
                        .font(.title)
                    HStack {
                        Text(os.codename)
                            .font(.title2)
                        Button {
                            modelData.toggle(favorite: os)
                        } label: {
                            if favorites.contains(os) {
                                Label("Remove Favorite", systemImage: "star.fill")
                                    .foregroundColor(.yellow)
                            } else {
                                Label("Add Favorite", systemImage: "star")
                            }
                        }
                        .labelStyle(.iconOnly)
                    }
                }
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Released:")
                        Spacer()
                        Text(os.releaseDate)
                            .foregroundColor(.secondary)
                    }
                    Divider()
                    HStack {
                        Text("Latest Version:")
                        Spacer()
                        Text(os.latestVersion)
                            .foregroundColor(.secondary)
                    }
                    Divider()
                    HStack {
                        Text("Architecture:")
                        Spacer()
                        Text(os.architecture.rawValue)
                            .foregroundColor(.secondary)
                    }
                    Divider()
                    HStack {
                        Text("Applications:")
                        Spacer()
                        Text(os.applications.rawValue)
                            .foregroundColor(.secondary)
                    }
                }
                .padding()
                
            }
            .frame(width: 280, height: 300)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.3), radius: 10, x: 10, y: 10)
            
        }
        .background(Image(os.background))
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let modelData = ModelData()
//
//        DetailView(os: example, favorites: Binding<modelData.favorites>)
//            .environmentObject(ModelData())
//    }
//}
