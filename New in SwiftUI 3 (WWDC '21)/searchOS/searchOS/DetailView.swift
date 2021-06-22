//
//  DetailView.swift
//  Search
//
//  Created by シェイミ on 21/06/2021.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.colorScheme) var colorScheme
    let os: MacOSModel
    
    var body: some View {
        VStack {
            Image(os.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            VStack(spacing: 20) {
                Text("macOS \(os.version) \(os.codename)")
                Text("Released \(os.releaseDate)")
                    .foregroundColor(.secondary)
            }
            .frame(width: 230, height: 100)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))

            
        }
        .background(Image(os.background))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(os: example)
            .preferredColorScheme(.light)
    }
}
