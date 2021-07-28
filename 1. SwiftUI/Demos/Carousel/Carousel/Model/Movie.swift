//
//  Movie.swift
//  Carousel
//
//  Created by シェイミ on 13/07/2021.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieName: String
    var artwork: String
}

var movies = [
    Movie(movieName: "Spirited Away", artwork: "poster1"),
    Movie(movieName: "Thirst", artwork: "poster2"),
    Movie(movieName: "Totoro", artwork: "poster3"),
    Movie(movieName: "Howl's Moving Castle", artwork: "poster4"),
    Movie(movieName: "All About Lily Chou-chou", artwork: "poster5"),
    Movie(movieName: "In The Mood For Love", artwork: "poster6"),
    Movie(movieName: "Trilogía", artwork: "poster7"),
    Movie(movieName: "The Devil's Backbone", artwork: "poster8"),
    Movie(movieName: "Onibaba", artwork: "poster9"),
]
