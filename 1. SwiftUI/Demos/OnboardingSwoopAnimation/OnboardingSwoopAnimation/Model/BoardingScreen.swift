//
//  BoardingScreen.swift
//  BoardingScreen
//
//  Created by Xianmo on 31/08/2021.
//
// Kavsoft demo https://youtu.be/rCgbJf5SWQE

import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
}

var boardingScreens: [BoardingScreen] = [
    BoardingScreen(image: "profiles_undraw", title: "Find Interesting \nPeople.", description: "Browse profiles to find people \nthat look like they're a bit of craic."),
    BoardingScreen(image: "sync_undraw", title: "Send Messages\nAnd Say Hi.", description: "Get in touch and have an 'aul chat.\nSee if you get along."),
    BoardingScreen(image: "beer_undraw", title: "Order Liquid Gold \nOnline.", description: "Put in an order for some social lubricant."),
    BoardingScreen(image: "fun_undraw", title: "See Where The World Takes You.", description: "This is what you were meant to do. \nIt's your destiny.")
]

