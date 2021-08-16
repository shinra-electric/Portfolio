//
//  OSRow.swift
//  searchOS
//
//  Created by シェイミ on 23/06/2021.
//

import SwiftUI

struct OSRow: View {
    let os: MacOSModel
    let isFavorite: Bool
    
    var body: some View {
        HStack {
            Image(os.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(os.codename)
                    .bold()
                Text(os.id)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct OSRow_Previews: PreviewProvider {
    static var previews: some View {
        OSRow(os: example, isFavorite: true)
    }
}
