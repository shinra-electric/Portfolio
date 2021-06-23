//
//  DetailView.swift
//  Search
//
//  Created by シェイミ on 21/06/2021.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var modelData: ModelData
    let os: MacOSModel
    
    var osIndex: Int {
        modelData.oses.firstIndex(where: { $0.id == os.id })!
    }
    
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
                        FavouriteButton(isSet: $modelData.oses[osIndex].isFavourite)
                    }
                    
                }
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Released:")
                        Spacer()
                        Text(os.releaseDate)
                    }
                    Divider()
                    HStack {
                        Text("Architecture:")
                        Spacer()
                        Text(os.architecture.rawValue)
                    }
                    Divider()
                    HStack {
                        Text("Applications:")
                        Spacer()
                        Text(os.applications.rawValue)
                    }
                }
                .padding()
                .foregroundColor(.secondary)
            }
            .frame(width: 280, height: 230)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.3), radius: 10, x: 10, y: 10)
            
        }
        .background(Image(os.background))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(os: example)
    }
}
