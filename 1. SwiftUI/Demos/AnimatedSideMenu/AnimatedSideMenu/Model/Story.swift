//
//  Story.swift
//  AnimatedSideMenu
//
//  Created by シェイミ on 19/11/2021.
//

import SwiftUI

// Model and sample data

struct Story: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
}


var stories = [

    Story(image: "Pic1", title: "Sailboats at Dawn"),
    Story(image: "Pic2", title: "Wilderness in the Moonlight"),
    Story(image: "Pic3", title: "Wishing Upon A Shooting Star"),
    Story(image: "Pic4", title: "Tatooine"),
    Story(image: "Pic5", title: "Forest Sunset"),
    Story(image: "Pic6", title: "Prey Sighted in the Savannah")
]



