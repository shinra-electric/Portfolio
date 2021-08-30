//
//  Intro.swift
//  Intro
//
//  Created by Xianmo on 23/08/2021.
//

import SwiftUI

// Intro model and sample intros

struct Intro: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var intros: [Intro] = [
    Intro(image: "thai", title: "Choose your favourite type of food", description: "We cater to all tastes", color: .pink),
    Intro(image: "curryrice", title: "Mix and match", description: "Brought to you from the four corners of the world", color: .indigo),
    Intro(image: "sushi", title: "Delivered to your door", description: "A magical cornucopia of flavours", color: .yellow)
]
 
