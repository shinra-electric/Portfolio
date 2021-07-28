//
//  Message.swift
//  Message
//
//  Created by シェイミ on 27/07/2021.
//

import SwiftUI

// Message model and sample data

struct Message: Identifiable {
    var id = UUID().uuidString
    var message: String
    var userName: String
}

var allMessages: [Message] = [
    Message(message: "Hey, anyone fancy heading out west?", userName: "Tripitaka"),
    Message(message: "What for? Is there anything interesting to eat there?", userName: "Pigsy"),
    Message(message: "I heard the weather is too dry, it would be bad for my complexion", userName: "Sandy"),
    Message(message: "Don't be so lazy! Let's go!", userName: "Monkey"),
    Message(message: "Only if you give me something to eat!", userName: "Pigsy"),
    Message(message: "How about I let you eat the short end of my 如意棒 staff?", userName: "Monkey"),
    Message(message: "Monkey! Violence is not permitted!", userName: "Tripitaka"),
    Message(message: "AmitofoAmitofoAmitofoAmitofoAmitofo....", userName: "Tripitaka"),
    Message(message: "Aiya! It hurts! It hurts! Make it stop!!", userName: "Monkey")
]
