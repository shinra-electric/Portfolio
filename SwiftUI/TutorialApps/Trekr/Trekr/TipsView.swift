//
//  TipsView.swift
//  Trekr
//
//  Created by シェイミ on 20/01/2021.
//

import SwiftUI

struct TipsView: View {
    let tips: [Tip]
    
    // This init could be dangerous with the crash operators, but in this case we know the data is there in the app bundle.
    // If the data wasn't there the app shouldn't try to continue anyway
    init() {
        let url = Bundle.main.url(forResource: "tips", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        tips = try! JSONDecoder().decode([Tip].self, from: data)
    }
    
    var body: some View {
        List(tips, id: \.text, children: \.children) { tip in
            if tip.children != nil {
                Label(tip.text, systemImage: "quote.bubble")
                    .font(.headline)
            } else {
                Text(tip.text)
            }
        }
        .navigationTitle("Tips")
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
