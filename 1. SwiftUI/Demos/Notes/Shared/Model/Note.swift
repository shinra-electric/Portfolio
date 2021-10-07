//
//  Note.swift
//  Note
//
//  Created by Xianmo on 07/10/2021.
//

import SwiftUI

// Note Model and example notes

struct Note: Identifiable {
    var id = UUID().uuidString
    var note: String
    var date: Date
    var cardColor: Color
}


// Getting sample date is just for varying the date field of the examples
func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var notes: [Note] = [

    Note(note: "Bad biscuits make the baker broke, bro.",
         date: getSampleDate(offset: 1), cardColor: Color("Skin")),
    
    Note(note: "I just thought about my anxieties, and it's like my mind hand touched a hot memory stove.",
         date: getSampleDate(offset: -10), cardColor: Color("Purple")),

    Note(note: "I miffed off a wizard and he took my eyes. I wonder what he wanted them for. Some kind of lotion, or potion...or time-traveling spell? I'll never know!",
         date: getSampleDate(offset: -15), cardColor: Color("Green")),

    Note(note: "Suckin' at something is the first step to being sorta good at something.",
         date: getSampleDate(offset: 10), cardColor: Color("Blue")),

    Note(note: "I have approximate knowlege of many things.",
         date: getSampleDate(offset: -3), cardColor: Color("Orange"))


]
